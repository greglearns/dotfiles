" syntax on
set nocompatible

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" --- vundle begin ---
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" let Vundle manage Vundle
" required!
" Bundle 'gmarik/vundle'

call plug#begin('~/.vim/bundle')
" Plugin 'gmarik/Vundle.vim'
" original repos on github
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'LnL7/vim-nix'
Plug 'racer-rust/vim-racer'
Plug 'avakhov/vim-yaml'
" Plug 'elmcast/elm-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andys8/vim-elm-syntax'
Plug 'elzr/vim-json'
Plug 'gmarik/ide-popup.vim'
Plug 'hjson/vim-hjson'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'
" Plug 'raimondi/delimitMate'
Plug 'rjayatilleka/vim-insert-char'
Plug 'rust-lang/rust.vim'
Plug 'evanleck/vim-svelte'
" Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'https://gitlab.com/n9n/vim-apl'
" Plug 'JavaScript-Indent'
" Plug 'Lokaltog/powerline'
" Plug 'Shougo/vimproc.vim'
" Plug 'bitc/vim-hdevtools'
" Plug 'brandonbloom/vim-factor'
" Plug 'cakebaker/scss-syntax.vim.git'
" Plug 'chase/vim-ansible-yaml'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'elm.vim'
" Plug 'frigoeu/psc-ide-vim'
" Plug 'gmarik/github-search.vim'
" Plug 'kien/ctrlp.vim'
" Plug 'maxmeyer/vim-taskjuggler'
" Plug 'mkitt/browser-refresh.vim'
" Plug 'raichoo/purescript-vim'
" Plug 'rizzatti/dash.vim'
" Plug 'rking/ag.vim'
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
" Plug 'VOoM'

" Plug 'Vitality'
" Plug 'bufexplorer.zip'
" Plug 'gitv'
" Plug 'Gundo'
" Plug 'Handlebars'
" Plug 'EasyMotion'
" Plug 'ZoomWin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()
" call vundle#end()            " required
" filetype plugin indent on    " required
" --- vundle end -----

" --- SETTINGS for vundle installs begin -----
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,nix,rs}"
  \ -g "!{.git,node_modules,vendor,target,result}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" let g:RefreshRunningBrowserDefault = 'chrome'
" let g:psc_ide_syntastic_mode = 1
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:vim_json_syntax_conceal = 0

" let g:elm_jump_to_error = 0
" let g:elm_make_output_file = "elm.js"
" let g:elm_make_show_warnings = 0
" let g:elm_syntastic_show_warnings = 0
" let g:elm_browser_command = ""
" let g:elm_detailed_complete = 0
" let g:elm_format_autosave = 1
" let g:elm_format_fail_silently = 0
" let g:elm_setup_keybindings = 1 " GREG maybe 0



" map <silent><leader>r :RRB<CR>
" imap \r <Esc>:RRB<CR>i

" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]((\.(git|hg|svn))|elm-stuff)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" let g:FactorRoot = '/Users/greg/project/factor'

" --- SETTINGS for vundle installs end -----

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" --- begin Greg improvements ----------

" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
" Examples: :let i = 1 | %s/abc/\='xyz_' . Inc()/g
" Examples: :let i=100 | :%s/abc/\=Inc(5)/g
" Examples: :let i = 27764 | %s/auid/\='' . Inc()/g
function Inc(...)
  let result = g:i
  let g:i += a:0 > 0 ? a:1 : 1
  return result
endfunction

:nnoremap <F5> "=strftime('%FT%T%z')<CR>P
:inoremap <F5> <C-R>=strftime('%FT%T%z')<CR>
:nnoremap <F6> "=trim(system('uuidgen'))<CR>p
:inoremap <F6> <C-R>=trim(system('uuidgen'))<CR>

" turn off annoying beep
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


" inoremap <Tab> <C-o>
inoremap <Tab> <Esc>l
" inoremap <Tab> <Esc>`^ " doesn't work on ubuntu?
"GREG this one above I used before for tab and it was good
" nnoremap <Tab> <Esc>i<Esc>
" inoremap <Leader><Tab> <Tab>

" nnoremap <Tab> <Esc>`^i<Esc>`^

" vmap <C-x> :!pbcopy<CR>
" vmap <C-c> :w !pbcopy<CR><CR>
" vmap <C-c> :!tee >(pbcopy)
" map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction
" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()





let g:netrw_list_hide='\.DS_Store'

set mouse=a

"
" Change cursor depending on insert mode
"
" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" in Terminal on the Mac, change insert mode cursor to a pipe
" if &term =~ "xterm"
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" tmux will only forward escape sequences to the terminal if surrounded by a
" DCS sequence
" "
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
"
" if exists('$TMUX')
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" nnoremap <F5> :GundoToggle<CR> " http://sjl.bitbucket.org/gundo.vim/

" jump to first word-letter within the first column
" ?\%1c\w
" jump to first word-letter within the cursor column
:map <Leader>parent :exe '?\%' . col(".") . 'c\w'

" highlight (partial) word under cursor without moving
" :map <Leader>8 :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
" :map <Leader>g8 :let @/ = expand('<cword>')\|set hlsearch<C-M>

" make it easier to type ':' commands without requiring the shift-key
noremap ;; ;
map ; :

" edit command-line
" map q; q:
" word completion
imap jj <C-n>

" show file list, even in Insert mode
imap \t <Esc><c-p>

" scratch buffer
" map <Leader>scratch <Esc>:e scratch<CR>:set buftype=nofile<CR>:set bufhidden=hide<CR>:setlocal noswapfile<CR>

" make Ack easier to access
nnoremap <Leader>a :Ack
" ack for current selection
vmap <Leader>a "sy:Ack! "<C-R>""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading'
endif


" ZoomWin
" nnoremap <Leader>z :ZoomWin<cr>

" keep searches away from the edge
" set scrolloff=1

" easier window navigation
nmap <C-H> <C-w>h<C-w>=
nmap <C-J> <C-w>j<C-w>=
nmap <C-K> <C-w>k<C-w>=
nmap <C-L> <C-w>l<C-w>=

" " close the window to the left of this one
" noremap <silent> <Leader>hc :wincmd h<cr>:close<cr>
" noremap <silent> <Leader>lc :wincmd l<cr>:close<cr>
" noremap <silent> <Leader>kc :wincmd k<cr>:close<cr>
" noremap <silent> <Leader>jc :wincmd j<cr>:close<cr>

" shortcut for Gdiff
" nnoremap :gd :Gdiff
" shortcut for duffupdate
nnoremap :du :diffupdate

" faster search and replaces
:nnoremap <Leader>s :%s///cg<Left><Left><Left><Left>
:nnoremap <Leader>ss :.,$s///cg<Left><Left><Left><Left>
:nnoremap <Leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>
:nnoremap <Leader>SS :.,$s/\<<C-r><C-w>\>//g<Left><Left>
:vmap <Leader>s "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
:vmap <Leader>S "sy:.,$s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/

" vmap <Leader>r "sy:%s/<C-R>"s/
" [I shows all instances of the word under the cursor in the document
" ]I shows all instances of the word under the cursor after your current location

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500
" set timeout timeoutlen=500 ttimeoutlen=100

"Prefer relative line numbering?
"set relativenumber"

"Enable code folding
set foldenable

"Shortcut to fold tags with leader (usually \) + ft
" nnoremap <leader>ft Vatzf

" More useful command-line completion
" set wildmenu

"Auto-completion menu
" set wildmode=list:longest

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
" nmap <C-Up> ddkP
" nmap <C-Down> ddp

"Bubble multiple lines
" vmap <C-Up> xkP`[V`]
" vmap <C-Down> xp`[V`]

" print empty <a> tag
" map! ;h <a href=""></a><ESC>5hi

" --- end Greg improvements ------------




" function! ToggleEnterMapping()
"   if empty(mapcheck('<CR>', 'i'))
"     inoremap <CR> <Esc>`^
"     return "\<Esc>"
"   else
"     iunmap <CR>
"     return "\<CR>"
"   endif
" endfunction
" call ToggleEnterMapping()
" inoremap <expr> <S-CR> ToggleEnterMapping()
" Optional (so <CR> cancels prefix, selection, operator).
inoremap <Leader><CR> <CR>
" inoremap <CR> <Esc>
" inoremap <CR> <Esc>`^
vnoremap <CR> <Esc>gV
onoremap <CR> <Esc>
" nnoremap <CR> <Esc>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>



" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
" set wildmode=list:longest,list:full
set wildignore+=*.png,*.jpg,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,.bundle,*/bundle/*,*/fixtures/*,*/node_modules/*,*/build/*

" Status bar
set laststatus=2

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

function! s:setupWrapping()
  :set wrap
  :set linebreak
  :set nolist
  :set textwidth=0
  :set wrapmargin=0
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
" au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufRead,BufNewFile *.txt set filetype=text
" autocmd FileType txt source ~/.vim/txt.vim
autocmd FileType apl source ~/.vim/apl.vim
autocmd FileType elm source ~/.vim/elm.vim
autocmd FileType rust source ~/.vim/rust.vim
autocmd FileType purs source ~/.vim/purescript.vim
autocmd FileType haskell source ~/.vim/haskell.vim
autocmd FileType javascript source ~/.vim/js.vim
autocmd FileType json source ~/.vim/json.vim
autocmd FileType ruby source ~/.vim/ruby.vim
autocmd FileType text source ~/.vim/text.vim

" add scss syntax highlighting
au BufRead,BufNewFile *.scss set filetype=scss

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
" filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
" cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" nmap <C-p> :Files<CR>
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>l :BLines<CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
" let g:syntastic_enable_signs=1
" let g:syntastic_quiet_messages = {'level': 'warnings'}
" let g:syntastic_html_tidy_ignore_errors=["is not recognized!"]

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
" color desert
set background=dark

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

function! ParagraphMove(delta, visual, count)
  normal m'
  normal |
  if a:visual
    normal gv
  endif

  if a:count == 0
    let limit = 1
  else
    let limit = a:count
  endif

  let i = 0
  while i < limit
    if a:delta > 0
      " first whitespace-only line following a non-whitespace character
      let pos1 = search("\\S", "W")
      let pos2 = search("^\\s*$", "W")
      if pos1 == 0 || pos2 == 0
        let pos = search("\\%$", "W")
      endif
    elseif a:delta < 0
      " first whitespace-only line preceding a non-whitespace character
      let pos1 = search("\\S", "bW")
      let pos2 = search("^\\s*$", "bW")
      if pos1 == 0 || pos2 == 0
        let pos = search("\\%^", "bW")
      endif
    endif
    let i += 1
  endwhile
  normal |
endfunction

nnoremap <silent> } :<C-U>call ParagraphMove( 1, 0, v:count)<CR>
onoremap <silent> } :<C-U>call ParagraphMove( 1, 0, v:count)<CR>
" vnoremap <silent> } :<C-U>call ParagraphMove( 1, 1)<CR>
nnoremap <silent> { :<C-U>call ParagraphMove(-1, 0, v:count)<CR>
onoremap <silent> { :<C-U>call ParagraphMove(-1, 0, v:count)<CR>
" vnoremap <silent> { :<C-U>call ParagraphMove(-1, 1)<CR>


"Noah Isaacson Additions

" Change match paren colors to be more readable
:hi MatchParen ctermfg=cyan ctermbg=black guifg=red guibg=black

" Trim trailing whitepsace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType haskell,c,cpp,elm,purs,js,javascript,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Replace tabs
fun! <SID>ReplaceTabs()
  let l = line(".")
  let c = col(".")
  %s/\t/  /e
  call cursor(l, c)
endfun

autocmd FileType haskell,c,cpp,elm,purs,js,javascript,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>ReplaceTabs()


" taken from https://coderwall.com/p/m2kp5q
" first install with npm install -g js-beautify
" nnoremap <leader>ff :%!js-beautify --indent-size 2 --keep-array-indentation --jslint-happy --preserve-newlines --quiet --break-chained-methods --file -<CR>

" if !empty(glob("src/Main.elm"))
"   argadd src/**/*.elm
" endif

" if !empty(glob("src/main.rs")) || !empty(glob("src/lib.rs"))
"   argadd src/**/*.rs
" endif

" BEGIN CoC COC config https://github.com/neoclide/coc.nvim

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <C-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"" nmap <silent> <TAB> <Plug>(coc-range-select)
"" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" set statusline+=%f

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" END Coc config
