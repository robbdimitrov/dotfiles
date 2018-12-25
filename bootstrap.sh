#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

echo "Getting latest version of dotfiles...";
echo "";

git pull origin master;

function install() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
}

function showSuccess() {
  echo "";
  echo "Install successful";
  echo "Run 'source ~/.zshrc' to finish the setup.";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	install;
  showSuccess;
else
  echo "";
	read -p "This may overwrite existing files in your home directory. Are you sure? (Yn) " -n 1;
  if [[ $REPLY != "" ]]; then
    echo "";
  fi;
	if [[ ! $REPLY =~ ^[Nn]$ ]]; then
		install;
    showSuccess;
	fi;
fi;

unset -f install;
