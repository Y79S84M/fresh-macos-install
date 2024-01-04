# Fresh dev environment installation script on MacOS

This script is meant to automate the local dev environment installation

## Pre-requisites

Before running the script, make sure you are on a bash shell thanks to the followinf command:

```bash
$ which $SHELL
```
the expected output should be:

"/bin/bash" or "/usr/bin/bash" depending on your environment.

if it is not the case, then execute the following command:

first display the list of available shells.

```bash
$ sudo cat /etc/shells
```

You should see a list that looks like the one below:

```text
/bin/bash
/bin/csh
/bin/dash
/bin/ksh
/bin/sh
/bin/zsh
etc ...
```

"/bin/bash" is the one we want to change to, thanks to the following command:

```bash
sudo chsh -s /bin/bash
```

You can also use this command for a specific user, like so:

```bash
sudo chsh -s /bin/bash -u username
```

Replace "username" by the username you want to have using bash.

If there is no error message, close the terminal, log out of the current session, log back in and restart you terminal.

execute the "which $SHELL" command to make sure you are now using bash.

## Installing home brew and packages

The scripts starts with installing homebrew, which is a great package manager for MacOs.

Then, if homebrew has been correctly installed and ready to work, it installs the packages I need.

- Essentials:

  - Formulae:

    - Thunderbird
    - Firefox
    - Brave browser
    - Vlc
    - Cowsay, required for my special/custom extra cool .bashrc file, which I may push on this repo.
    - Tree
    - Tmux

  - Casks:
  
    - Spectacle, move and resize windows with ease and simple keybindings.

- Dev tools:

  - Formulae:

    - iTerm2
    - Git
    - Vcprompt, this displays the name of the git branch I'm in, directly in the terminal
    - Vim, when I'm bored
    - Emacs, when I'm extra bored
    - Php
    - OpenJdk
    - Mariadb
    - sqlite3
    - yarn

  - Casks:

    - Insomnia
    - Intellij idea
    - PhpStorm
    - Visual studio code

Note that this list is not exhaustive and is subject to changes, and guess what ? It is easily done in the bash script.

## Adding or Modifying packages

Dead simple !

Do you see the array named "packages" ?

Cool, then add new packages, delete or rename some of them so that the script installs only the packages you need 🫵


