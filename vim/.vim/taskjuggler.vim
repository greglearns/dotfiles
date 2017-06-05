inoremap efff <Esc>bieffort <Esc>Ypibetter:<Esc>piworse:<Esc>piexpected:<Esc>kk^f l
inoremap tsk <Esc>yyp:s/^  *//e<CR>:s/  *$//e<CR>:s/[^-_ a-zA-Z0-9]//ge<CR>:s/ /_/ge<CR>Vu==itask <Esc>kddpkA "<Esc>JxA" {<CR>}<Esc>:noh<CR>ko
inoremap comppp complete: <Esc>:r ! ruby -e "require 'date'; print Date.today.to_s"<CR>kJ$a
inoremap tms <Esc>mo:read! ruby -e "print Time.now.strftime('\%Y.\%m.\%d.\%H.\%M.\%S')"<CR>`oJEa
