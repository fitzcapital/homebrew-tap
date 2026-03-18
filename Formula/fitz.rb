class Fitz < Formula
  include Language::Python::Virtualenv

  desc "Fitz terminal status dashboard"
  homepage "https://github.com/fitzcapital/fitz"
  head "https://github.com/fitzcapital/fitz.git", branch: "main"

  depends_on "python@3.13"

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/4f/db/cfac1baf10650ab4d1c111714410d2fbb77ac5a616db26775db562c8fab2/setuptools-82.0.1.tar.gz"
    sha256 "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
  end

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/89/24/a2eb353a6edac9a0303977c4cb048134959dd2a51b48a269dfc9dde00c8a/wheel-0.46.3.tar.gz"
    sha256 "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/aa/c6/d1ddf4abb55e93cebc4f2ed8b5d6dbad109ecb8d63748dd2b20ab5e57ebe/psutil-7.2.2.tar.gz"
    sha256 "0746f5f8d406af344fd547f1c8daa5f5c33dbc293bb8d6a16d80b4bb88f59372"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install resources
    system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "--no-build-isolation", buildpath
    bin.install_symlink libexec/"bin/fitz"
  end

  test do
    assert_match "the following arguments are required: command",
                 shell_output("#{bin}/fitz 2>&1", 2)
    assert_match "interactive terminal",
                 shell_output("#{bin}/fitz status </dev/null 2>&1", 1)
  end
end
