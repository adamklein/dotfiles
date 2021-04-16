alias v='vi'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# reload bashrc
alias rrc="source ~/.bashrc"

# git
alias ga='git add'
alias gp='git push'
alias gpb='git push --set-upstream origin $(git branch | grep \* | cut -d " " -f2)'

alias gl='git log --oneline'
alias gs='git status'
alias gd='git diff --color'

alias gca='git commit -am'

alias gb='git branch'

alias gc='git checkout'
alias gco=fbr
alias gbr='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias grp='git remote prune'
alias gcl='git clone'
alias gpull='git pull --ff-only'

# delete all local branches that are already merged into the currently checked out branch
alias gclean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
# delete all untracked files
alias gdelete='gms | tail -n +5 | nocolor | awk "{ print $1 }" | xargs rm -rf'

# activate python env
alias pya='source activate'
alias pyd='source deactivate'

# jupyter
alias jn='jupyter notebook'
alias jnc='jupyter notebook --notebook-dir=`pwd`'

# some more ls aliases
alias l='ls -lh --color=auto'
alias ll='ls -AlFh --color=auto'
alias la='ls -A --color=auto'
alias lt='ls -AlFht --color=auto'

# grep colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# grep alias
alias gi='grep -i'

# some more ls aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

alias silent=runsilent

