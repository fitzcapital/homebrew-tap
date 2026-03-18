# fitzcapital/homebrew-tap

Homebrew tap for the Fitz CLI.

## Install

```bash
brew tap fitzcapital/tap
brew install --HEAD fitzcapital/tap/fitz
fitz status
```

## Publish

```bash
git init
git branch -M main
git remote add origin git@github.com:fitzcapital/homebrew-tap.git
git add .
git commit -m "Add fitz formula"
git push -u origin main
```

Homebrew resolves `fitzcapital/tap` to the GitHub repository
`https://github.com/fitzcapital/homebrew-tap`.
