inoremap xxx [x]
" hi clear SpellCap
" hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
" autocmd BufEnter *.txt set spell
" set spell

" hi clear SpellBad
" hi SpellBad cterm=underline
" :h hl-SpellBad " get help on highlighting

function! GregOutlineLevel()
  let h = matchstr(getline(v:lnum), '\v^[.]+')
  if empty(h)
    return "="
    " return -1
  else
    return ">" . len(h)
  endif
endfunction

au BufEnter *.txt setlocal foldexpr=GregOutlineLevel()
au BufEnter *.txt setlocal foldmethod=expr
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set fillchars=

"     if getline(v:lnum) =~ '^# .*$'
"         return ">1"
"     endif
"     if getline(v:lnum) =~ '^## .*$'
"         return ">2"
"     endif
"     if getline(v:lnum) =~ '^### .*$'
"         return ">3"
"     endif
"     if getline(v:lnum) =~ '^#### .*$'
"         return ">4"
"     endif
"     if getline(v:lnum) =~ '^##### .*$'
"         return ">5"
"     endif
"     if getline(v:lnum) =~ '^###### .*$'
"         return ">6"
"     endif
"     return "=" 
" endfunction

" set foldtext=MyFoldText()
" function MyFoldText()
"   let line = getline(v:foldstart)
"   let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
"   return v:folddashes . sub
" endfunction
"
