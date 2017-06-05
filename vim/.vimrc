" syntax on
set nocompatible

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" --- vundle begin ---
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"set rtp+=~/.vim/bundle/vundle/
"set rtp+=~/.vim/bundle/vundle/doc/
"call vundle#rc()

" let Vundle manage Vundle
" required!
" Bundle 'gmarik/vundle'

Plugin 'gmarik/Vundle.vim'
" original repos on github
Plugin 'bitc/vim-hdevtools'
Plugin 'rizzatti/dash.vim'
Plugin 'elzr/vim-json'
Plugin 'rust-lang/rust.vim'
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'elm.vim'
Plugin 'mbbill/undotree'
Plugin 'raimondi/delimitMate'
Plugin 'elmcast/elm-vim'
Plugin 'mattn/emmet-vim.git'
Plugin 'raichoo/purescript-vim'
Plugin 'frigoeu/psc-ide-vim'
Plugin 'pangloss/vim-javascript.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'cakebaker/scss-syntax.vim.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
" Plugin 'mkitt/browser-refresh.vim'
Plugin 'gmarik/ide-popup.vim'
Plugin 'gmarik/github-search.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'avakhov/vim-yaml'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
" Plugin 'brandonbloom/vim-factor'
" Plugin 'JavaScript-Indent'
" Plugin 'maxmeyer/vim-taskjuggler'
" Plugin 'Lokaltog/powerline'
" Plugin 'chase/vim-ansible-yaml'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
" Plugin 'VOoM'

" Plugin 'Vitality'
Plugin 'bufexplorer.zip'
Plugin 'gitv'
Plugin 'Gundo'
" Plugin 'Handlebars'
Plugin 'EasyMotion'
Plugin 'ZoomWin'
Plugin 'surround.vim'
Plugin 'repeat.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" --- vundle end -----

" --- SETTINGS for vundle installs begin -----
let g:vim_json_syntax_conceal = 0
let g:RefreshRunningBrowserDefault = 'chrome'
let g:rustfmt_autosave = 1
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
let g:psc_ide_syntastic_mode = 1

map <silent><leader>r :RRB<CR>
imap \r <Esc>:RRB<CR>i

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]((\.(git|hg|svn))|elm-stuff)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" let g:FactorRoot = '/Users/greg/project/factor'

" --- SETTINGS for vundle installs end -----

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" --- begin Greg improvements ----------

" turn off annoying beep
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


inoremap <Tab> <Esc>`^
nnoremap <Tab> <Esc>i<Esc>
" nnoremap <Tab> <Esc>`^i<Esc>`^
inoremap <Leader><Tab> <Tab>

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

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()





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

nnoremap <F5> :GundoToggle<CR> " http://sjl.bitbucket.org/gundo.vim/

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
map q; q:
" word completion
imap jj <C-n>

" show file list, even in Insert mode
imap \t <Esc><c-p>

" scratch buffer
map <Leader>scratch <Esc>:e scratch<CR>:set buftype=nofile<CR>:set bufhidden=hide<CR>:setlocal noswapfile<CR>

" make Ack easier to access
nnoremap <Leader>a :Ag
" ack for current selection
vmap <Leader>a "sy:Ag! "<C-R>""

" ZoomWin
nnoremap <Leader>z :ZoomWin<cr>

" keep searches away from the edge
" set scrolloff=1

" easier window navigation
nmap <C-H> <C-w>h<C-w>=
nmap <C-J> <C-w>j<C-w>=
nmap <C-K> <C-w>k<C-w>=
nmap <C-L> <C-w>l<C-w>=

" close the window to the left of this one
noremap <silent> <Leader>hc :wincmd h<cr>:close<cr>
noremap <silent> <Leader>lc :wincmd l<cr>:close<cr>
noremap <silent> <Leader>kc :wincmd k<cr>:close<cr>
noremap <silent> <Leader>jc :wincmd j<cr>:close<cr>

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

"Prefer relative line numbering?
"set relativenumber"

"Enable code folding
set foldenable

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

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
inoremap <CR> <Esc>
inoremap <Leader><CR> <CR>
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
autocmd FileType elm source ~/.vim/elm.vim
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
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_html_tidy_ignore_errors=["is not recognized!"]

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color desert

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
nnoremap <leader>ff :%!js-beautify --indent-size 2 --keep-array-indentation --jslint-happy --preserve-newlines --quiet --break-chained-methods --file -<CR>

if !empty(glob("src/Main.elm"))
  argadd src/*.elm
endif

if !empty(glob("src/main.rs")) || !empty(glob("src/lib.rs"))
  argadd src/*.rs
endif

