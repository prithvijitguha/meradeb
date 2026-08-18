#!/bin/bash

# Configure the bash shell using omadeb defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
\cp ~/.local/share/omadeb/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omadeb/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using omadeb defaults
\cp ~/.local/share/omadeb/configs/inputrc ~/.inputrc
