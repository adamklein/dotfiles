export HOME="/Users/adam"

if [ -f $HOME/.bash_personal ]; then
    . $HOME/.bash_personal
fi

# for ADA/gnat compiler
# PATH=/usr/local/gnat/bin:$PATH; export PATH

# MKL_NUM_THREADS=1
# export MKL_NUM_THREADS

# application path
export PATH=/Applications/MacVim.app/Contents/MacOS/:/usr/local/share/python:/usr/texbin:$PATH

# python path
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH

# setup virtualenv for python
export WORKON_HOME=$HOME/.virtualenvs
source virtualenvwrapper.sh
