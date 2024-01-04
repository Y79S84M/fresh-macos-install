#!/bin/bash
# Install all required brew packages for my setup

# packages name to be installed
packages=("php" "openjdk@17" "mariadb" "git");

# casks packages name to be installed
cask_packages=("firefox" "thunderbird" "brave-browser" "iterm2" "vlc")

# installing xcode
xcode-select --install

# installing homebrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#if [[ $? -eq 0 ]]
#then
#	echo "Homebrew has been successfully installed"	
#fi

# This command makes sure that homebrew is up and running
brew doctor

brew_doctor_status_code=$?

echo "brew doctor command exited with code: $brew_doctor_status_code"

if [[ $brew_doctor_status_code -eq 0 ]]
then
	i=0
	echo "Homebrew will now install listed formulae"
	while [[ $i -lt ${#packages[@]} ]]
	do
		echo "installing ${packages[i]}"
		brew install ${packages[i]}
		if [[ $? -ne 0 ]]
		then
			echo "Oops ! there was a problem while installing ${packages[i]}"
		fi
		((i++))
	done
fi
