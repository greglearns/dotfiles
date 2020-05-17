setlocal tabstop=4 shiftwidth=4 expandtab
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" NOTE: ^wi goes to definition in new split (like gs)
" NOTE: :help index to see all commands
" nnoremap <silent> <F1> :help normal-index<CR>
" inoremap <silent> <F1> <C-O>:help insert-index<CR>
" NOTE: :xn seems to show all bindings for Tcomment
" NOTE: g; does to last place edited
" NOTE: gi goes to last insertion point, in insert mode
"
" I often make functions for editing tasks, and store them in my .vimrc so I can find them again. For example reading .Net callstacks that have been converted into a single line:
" function! FixCallStacks()
" :%s;\[NLN\];\r;g
" :%s;\[TAB\];\t;g
" endfunction
