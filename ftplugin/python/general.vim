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

set omnifunc=pythoncomplete#Complete
set completeopt=menu,longest,preview
set pumheight=6    " keep a small popup menu window

setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufEnter *.py setlocal colorcolumn=79

set tags+=~/.vim/tags/python.tags

" Run pep8
let g:pep8_map='<leader>8'

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0
