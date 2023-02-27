source "./bootstrap.sh"

echo
echo "➡️  test for remotes"
git remote -v

echo
echo "➡️  install homebrew"
echo "sudo password required"
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash

echo
echo "➡️  which brew"
which brew
