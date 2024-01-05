#!/bin/bash
# Create Dev directory and its sub-directories
default_shell_was_bash_already=true
bash_shell_is_listed=$(cat /etc/shells | grep -e /*/bash)
bash_shell="/bin/bash"
pwd=$(pwd)
home_directory="/Users/$USER"
dev_directory="$home_directory/Dev"
dev_sub_directories=("/Php" "/Java" "/Bash")

change_shell_to_bash() {
    if [[ $bash_shell_is_listed ]] && [[ $(which $SHELL) != $bash_shell ]]
    then
	echo "================================"
	echo "Changing $(which shell) to $bash_shell and it requires your password !"
	echo
	chsh -s $bash_shell -u $USER
	default_shell_was_bash_already=false
    fi
}

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

create_dev_directories() {    
if [[ $pwd == $home_directory ]]
then
    echo "================================"
    echo "Creating Dev directories"
    echo
    create_directories
else
    echo "================================"
    echo "Changing to home directory"
    cd $home_directory
    echo "Creating Dev directories"
    create_directories
fi
}

echo "================================"
echo "--       INITIALISATION       --"
echo "================================"
echo 
echo "Checking shell !"
echo
change_shell_to_bash

create_dev_directories

echo "================================"
echo "--       Choose your OS       --"
echo "================================"
echo

select os in Linux MacOS Exit; do
    case $os in
	Linux)
	    echo "================================"
	    echo "You choose linux"
	    echo "installing apt packages"
	    echo
	    sudo su - $USER -c './linux/install-apt-packages.sh'
	    break ;;
	MacOS)
	    echo "================================"
	    echo "You choose macos"
	    echo "installing homebrew packages"
	    echo
	    sudo su - $USER -c $pwd/macos/install-homebrew-packages.sh
            break ;;
	Exit)
	    echo "================================"
	    echo "Exiting ..."
	    break ;;
	*)
	    echo "You must type 1 or 2 in order to select your OS"
	    ;;
    esac
done
exit 0

# installing xcode
xcode-select --install

# Install all required brew packages for my setup
# packages name to be installed
packages=("wget" "cowsay" "tree" "tmux" "git" "vcprompt" "vim" "php" "openjdk@17" "mariadb" "sqlite3" "yarn")

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

if [[ $brew_doctor_status_code -lt 2 ]]
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
