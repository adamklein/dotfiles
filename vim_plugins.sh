#!/bin/sh

# This script initializes vim w/ plugins on ubuntu

mkdir ~/.vim
mkdir ~/.vim/autoload/
mkdir ~/.vim/tmp

cd ~/.vim

git init

git clone https://github.com/tpope/vim-pathogen.git tmp/pathogen
mv tmp/pathogen/autoload/pathogen.vim ~/.vim/autoload

git submodule add https://github.com/git-mirror/vim-l9.git bundle/l9
git submodule add https://github.com/vim-scripts/taglist.vim.git bundle/taglist
git submodule add https://github.com/vim-scripts/FuzzyFinder.git bundle/fuzzyfinder
git submodule add https://github.com/slack/vim-bufexplorer.git bundle/bufexplorer
git submodule add https://github.com/vim-scripts/argtextobj.vim.git bundle/argtextobj
git submodule add https://github.com/marcus/autotag.vim.git bundle/autotag
git submodule add https://github.com/michaeljsmith/vim-indent-object.git bundle/indent-object
git submodule add https://github.com/altercation/vim-colors-solarized.git bundle/solarized
git submodule add https://github.com/mitechie/pyflakes-pathogen.git bundle/pyflakes
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
git submodule add https://github.com/tpope/vim-surround.git bundle/surround
git submodule add https://github.com/tpope/vim-git.git bundle/git
git submodule add https://github.com/wincent/Command-T.git bundle/command-t
git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
git submodule add https://github.com/sontek/rope-vim.git bundle/ropevim
git submodule add https://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter
git submodule add https://github.com/vim-scripts/cscope_macros.vim.git bundle/cscope_macros

git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update

cd bundle/command-t
rake make

cd ~/.vim
mkdir tags
ctags -R -f ~/.vim/tags/python.ctags ~/.virtualenvs/py27
ctags -R -f ~/.vim/tags/usr.include.tags /usr/include
