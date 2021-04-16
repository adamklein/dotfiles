# .bashrc
#
# This file is read by csh/tcsh when they startup from a login,
# rlogin or telnet.
#
# Use "man initfiles" for more documentation.
# Do not take the following lines out unless you're really sure of
# what you are doing.
defaultsdir=/usr/local/lib/initfiles
if [ -r $defaultsdir/system-bashrc ]; then
   source $defaultsdir/system-bashrc
fi

export EDITOR='vim'

# *** PATH SETTINGS


# *** END PATH SETTINGS

# set time zone
export TZ=America/New_York

# sort order to put underscores first.
export LC_COLLATE="POSIX"

# aliases
source "$HOME/.bash_aliases"

# git completion
source $HOME/.git-completion
source $HOME/.bash_prompt

# bashmarks
source $HOME/.bashmarks

source "${HOME}/.config/bash/git"
source "${HOME}/.config/bash/shell"

# *** HISTORY CONTROL

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# *** END HISTORY CONTROL

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
