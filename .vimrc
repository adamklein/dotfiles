set nocompatible              " Don't be compatible with vi
set hidden                    " hidden buffer management
let mapleader=","             " change the leader to be a comma vs slash

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

" run py.test's
nnoremap <silent><Leader>tf <Esc>:Pytest file<CR>
nnoremap <silent><Leader>tc <Esc>:Pytest class<CR>
nnoremap <silent><Leader>tm <Esc>:Pytest method<CR>
nnoremap <silent><Leader>dm <Esc>:Pytest method --pdb<CR>
nnoremap <silent><Leader>tn <Esc>:Pytest next<CR>
nnoremap <silent><Leader>tp <Esc>:Pytest previous<CR>
nnoremap <silent><Leader>te <Esc>:Pytest error<CR>

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set grepprg=ack-grep          " replace the default grep program with ack

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

autocmd FileType * setlocal colorcolumn=0

"" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=%f\ [%02n]\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ %=[%l,%v]\ %P\ %M

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    colorscheme solarized
else
    colorscheme torte
endif

" Paste from clipboard
map <leader>p "+gP

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" taglist plugin
nnoremap <silent> <leader>l :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)

imap <buffer><Tab> <M-/>

" Cython
au BufRead,BufNewFile *.pyx set filetype=cython

"
" Don't allow snipmate to take over tab
" autocmd VimEnter * ino <c-j> <c-r>=TriggerSnippet()<cr>
" autocmd VimEnter * snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" ===========================================================
" filetype specific changes
" ============================================================
"
" python
au filetype python set omnifunc=pythoncomplete#Complete
let g:supertabdefaultcompletiontype = "context"
let g:SuperTabRetainCompletionDuration="completion"
set completeopt=menuone,longest,preview
set pumheight=6             " keep a small completion window

au FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au BufEnter *.py setlocal colorcolumn=79

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUALENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

" ropevim plugin
"
let ropevim_extended_complete=1
let ropevim_guess_project=1

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" Some personal preferences:

nnoremap ' `
nnoremap ` '

" Toggle the tasklist
map <leader>td <Plug>TaskList

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Run pep8
let g:pep8_map='<leader>8'

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>co :copen<CR>
nmap <leader>cc :cclose<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier to write"
nnoremap <leader>w :w<CR>

" this is fuzzy finder
nnoremap <leader>ff :FufFile **/<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fl :FufLine<CR>

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Ack searching
nmap <leader>a <Esc>:Ack! <cword>

" Load the Gundo window
map <leader>u :GundoToggle<CR>

" remap escape to double k
inoremap kk <ESC>

" MakeGreen, play nice with leader-t
" change from <Leader>t to <Leader>]
map <Leader>] <Plug>MakeGreen 

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
