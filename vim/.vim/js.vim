" inoremap llll console.log('----------');
" inoremap lll console.log();<C-o>F)
" inoremap <Leader>describe describe('', function() {<CR><CR>})<CR><Esc>kkk0f'a
" inoremap <Leader>it it('', function() {<CR><CR>})<CR><Esc>kkk0f'a
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
" Use formatprg when available
" let g:neoformat_try_formatprg = 1
" autocmd BufWritePre *.js Neoformat
" let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
