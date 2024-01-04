#!/bin/bash
# Install all required brew packages for my setup

# packages name to be installed
packages=("php" "openjdk@17" "mariadb" "git");

# casks packages name to be installed
cask_packages=("firefox" "thunderbird" "brave-browser" "iterm2" "vlc")
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~/
if [[ $? -eq 0 ]]
then
	i=0
	echo "Homebrew has been successfully installed"
	echo "Homebrew will now install listed formulae"
	while [[ $i -lt ${#packages[@]} ]]
	do
		echo "i=$i"
		echo "installing ${packages[i]}"
		brew install ${packages[i]}
		if [[ $? -ne 0 ]]
		then
			echo "Oops ! there was a problem while installing ${packages[i]}"
		fi
		((i++))
	done
fi

