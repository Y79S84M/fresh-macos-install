#!/bin/bash
# Create Dev directory and its sub-directories
pwd=$(pwd)
home_directory="/Users/$USER"
dev_directory="$home_directory/Dev"
dev_sub_directories=("/Php" "/Java" "/Bash")

create_dev_subdirectories() {
    i=0
    while [[ $i -lt ${#dev_sub_directories[@]} ]]
    do
	echo "Creating $dev_directory${dev_sub_directories[i]}"
	mkdir $dev_directory${dev_sub_directories[i]}
	((i++))
    done
}

create_directories() {
    mkdir Dev
    create_dev_subdirectories
}

if [[ $pwd == $home_directory ]]
then
    echo "Creating Dev directories"
    create_directories
else
    echo "Changing to home directory"
    cd $home_directory
    echo "Creating Dev directories"
    create_directories
fi

# installing xcode
xcode-select --install

# Install all required brew packages for my setup
# packages name to be installed
packages=("cowsay" "tree" "tmux" "git" "vcprompt" "vim" "php" "openjdk@17" "mariadb" "sqlite3" "yarn")

# casks packages name to be installed
cask_packages=("spectacle" "firefox" "thunderbird" "brave-browser" "vlc" "iterm2" "Insomnia" "Intellij-idea" "phpstorm" "visual-studio-code")

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ $? -eq 0 ]]
then
	echo "Homebrew has been successfully installed"	
fi

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
		((i++))
	done
	i=0
	while [[ $i -lt ${#cask_packages[@]} ]]
	do
		echo "installing ${cask_packages[i]}"
		brew install ${cask_packages[i]}
		((i++))
	done
fi

# installing nvm - node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

command -v nvm
if [[ $? -eq 0 ]]
then
    nvm install --lts
else
    echo "In order to install the desired node version, close your terminal and restart it."
    echo "then, execute the command nvm insall --lts"
fi
