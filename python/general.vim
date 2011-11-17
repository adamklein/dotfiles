" create a function that executes the command on the contents
" of the buffer it is run within
function! ExecAndPreview(cmd)
    pclose! " force preview window closed
    " copy buffer to new window, then run through python
    sil %y a | below new | sil put a | sil execute "%!" . a:cmd
    " indicate the output window as the current previewwindow
    setlocal previewwindow ro nomodifiable nomodified
    " unload from memory when closed
    setlocal bufhidden=unload
    " back into the original window
    winc p
endfunction

" Use leader-x to execute the current buffer into preview window
" And leader-xx to close the preview window when done
nnoremap <leader>x :call ExecAndPreview("python")<CR>
nnoremap <leader>xx :pclose<CR>

let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionDuration="completion"

set omnifunc=pythoncomplete#Complete
set completeopt=menu,longest,preview
set pumheight=6    " keep a small popup menu window

setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufEnter *.py setlocal colorcolumn=79

" Run pep8
let g:pep8_map='<leader>8'

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" run py.test's
nnoremap <silent><Leader>tf <Esc>:Pytest file<CR>
nnoremap <silent><Leader>df <Esc>:Pytest file --pdb<CR>
nnoremap <silent><Leader>tc <Esc>:Pytest class<CR>
nnoremap <silent><Leader>tm <Esc>:Pytest method<CR>
nnoremap <silent><Leader>dm <Esc>:Pytest method --pdb<CR>
nnoremap <silent><Leader>tn <Esc>:Pytest next<CR>
nnoremap <silent><Leader>tp <Esc>:Pytest previous<CR>
nnoremap <silent><Leader>te <Esc>:Pytest error<CR>

" don't outdent hashes
inoremap # #
