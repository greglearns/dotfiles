setlocal tabstop=4 shiftwidth=4 expandtab
nmap <Leader>w :.w >> /tmp/apl-stdin<CR>
vmap <Leader>v :'<,'>w >> /tmp/apl-stdin<CR>
" mkfifo /tmp/apl-stdin
" tail -f /tmp/apl-stdin |/Applications/Dyalog-17.0.app/Contents/Resources/Dyalog/dyalog
