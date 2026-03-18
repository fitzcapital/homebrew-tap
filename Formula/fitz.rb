class Fitz < Formula
  include Language::Python::Virtualenv

  desc "Fitz terminal status dashboard"
  homepage "https://github.com/fitzcapital/mccain-capital-repo"
  head "https://github.com/fitzcapital/mccain-capital-repo.git", branch: "main"

  depends_on "python@3.13"

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
