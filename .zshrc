#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# paths
export PATH=~/miniconda3/bin:$PATH

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# cd=pushcd
setopt AUTO_PUSHD

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
#
alias v='vim'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# some more ls aliases
alias l='ls -A'
alias ll='ls -alFh'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias pya='source activate'
alias pyd='source deactivate'

alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias b="showmarks"

