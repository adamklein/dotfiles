export HOME=~

if [ -f $HOME/.bash_personal ]; then
    . $HOME/.bash_personal
fi

# for ADA/gnat compiler
# PATH=/usr/local/gnat/bin:$PATH; export PATH

# MKL_NUM_THREADS=1
# export MKL_NUM_THREADS

# application path
export PATH=/home/aklein/bin:$PATH

# python path
# export PYTHONPATH=:$PYTHONPATH


# setup virtualenv for python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
