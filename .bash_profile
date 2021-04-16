export HOME=~

if [ -f $HOME/.bash_personal ]; then
    . $HOME/.bash_personal
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/adamklein/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/adamklein/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/adamklein/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/adamklein/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

