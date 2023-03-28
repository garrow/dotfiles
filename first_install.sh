source "./bootstrap.sh"

echo
echo "➡️  test for remotes"
git remote -v

echo
echo "Lock in git username"
git config --local --replace-all user.name "$(git config --file "${PWD}/git/gitconfig" --get user.name)"
git config --local --replace-all user.email "$(git config --file "${PWD}/git/gitconfig" --get user.email)"
git config --local --get user.name
git config --local --get user.email


echo
echo "➡️  install homebrew"
echo "sudo password required"
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash

echo
echo "➡️  which brew"
which brew


echo
echo "➡️  expected places"
mkdir -p "${HOME}/projects"
touch "${HOME}/.extras.rc.sh"
