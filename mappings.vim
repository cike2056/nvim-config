" mappings
" mapleader
let mapleader=","
" Disable CTRL-A on tmux or on screen
if $TERM =~ 'screen'
  nnoremap <C-a> <nop>
  nnoremap <Leader><C-a> <C-a>
endif
" Disable arrow key in vim, see https://goo.gl/s1yfh4.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" Navigation in the location and quickfix list ....code
nnoremap [l :lprevious<CR>zv
nnoremap ]l :lnext<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap [q :cprevious<CR>zv
nnoremap ]q :cnext<CR>zv
nnoremap [Q :cfirst<CR>zv
nnoremap ]Q :clast<CR>zv
" Close location list or quickfix list if they are present,
nnoremap<silent> \x :windo lclose <bar> cclose<CR>
" Use Esc to quit builtin terminal
tnoremap <ESC>   <C-\><C-n>
" When completion menu is shown, use <cr> to select an item
" and do not add an annoying newline. Otherwise, <enter> is what it is.
inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" Use <esc> to close auto-completion menu
inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))
" Edit and reload init.vim quickly
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Nvim config successfully veloaded!"<cr>

nnoremap ; :
xnoremap ; :
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
noremap H ^
noremap L $
xnoremap < <gv
xnoremap > >gv
" Decrease indent level in insert mode with shift+tab
inoremap <S-Tab> <ESC><<i
" Remove trailing whitespace characters
nnoremap <silent> <leader>xs :call utils#StripTrailingWhitespaces()<CR>
" check the syntax group of current cursor position
nnoremap <silent> <leader>st :call utils#SynGroup()<CR>
" Quit 
inoremap <C-q> <Esc>:q<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-Q> :q!<CR>
vnoremap <C-q> <esc>
nnoremap <leader>q :bp <BAR> bd #<CR>
nnoremap <Leader>w :update<CR>
nnoremap <leader>Q :q!<CR>
nmap QA :qa!<CR>
nmap QQ ZZ
imap QQ <Esc>ZZ
" Quicker <Esc> in insert mode
inoremap ii <Esc>
inoremap jk <Esc>
" Paste non-linewise text above or below current cursor,
nnoremap <leader>p m`o<ESC>p``
nnoremap <leader>P m`O<ESC>p``
" Insert a blank line below or above current line (do not move the cursor),
nnoremap <expr> oo 'm`' . v:count1 . 'o<Esc>``'
nnoremap <expr> OO 'm`' . v:count1 . 'O<Esc>``'
" Change text without putting the text into register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
nnoremap x "_x
nnoremap X "_X
" Turn the word under cursor to upper case
inoremap <silent> <C-U> <Esc>viwUea
" Make Y behave like other capitals
nnoremap Y y$
" Tags
nnoremap <C-]> g<C-]>
nnoremap g[ :pop<cr>
" 2x scroll speed
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <C-j> 5<C-e>
nnoremap <C-k> 5<C-y>
" Movement in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <Del>
nnoremap [     0
nnoremap ]     $
noremap <Home>    0
noremap <End>     $
" no white space
xnoremap $ g_
nnoremap <Tab> %
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_
" hlsearch 
" Use sane regex expression (see `:h magic` for more info)
nnoremap / /\v
nmap <space> /
nmap <space><space> ?
" clear search results
nnoremap // :noh<CR>
" Toggle search highlight, see https://goo.gl/3H85hh
nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" Find and replace (like Sublime Text 3)
nnoremap <C-R> :%s/
xnoremap <C-R> :s/
" Change current working directory locally and print cwd after that,
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" save as sudo
nmap W! :w !sudo tee "%"<CR>
" select all
map <leader>sa ggVG

" buffers -------------------------------------
" which buffer
nnoremap gb :ls<CR>:b<space>
" buffer new ,select
" new buffer
" todo
" nnoremap <C-b>     :enew<CR>
" inoremap <C-b>     <Esc>:enew<CR>
nmap <leader>b :enew<CR>
nmap bb :enew<CR>
nmap <leader><leader>n :bnext!<CR>
nmap <leader><leader>l :bnext!<CR>
nmap <leader><leader>h :bprevious!<CR>

" window
nnoremap <leader>v :vnew<CR> <BAR> :e<space>
nnoremap vv :vnew<CR> <BAR> :e<space>
nnoremap -- :new<CR> <BAR> :e<space>
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>n <C-w>w
" Resize windows using <Alt> and h,j,k,l, inspiration from
nnoremap <silent> <M-H> <C-w><
nnoremap <silent> <M-L> <C-w>>
nnoremap <silent> <M-J> <C-W>-
nnoremap <silent> <M-K> <C-W>+
"qq 关闭window


" tabs
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap tt :tabnew<cr>
map <leader><leader>t :tabnew<cr>
map <leader>tq :tabclose<cr>
map <leader>tm :tabm<cr>
map <leader>tl :tabn<CR>
map <leader>th :tabp<CR>


" F1 F4 F10 F11 已经占用
" F2 开启/关闭行号
" F3 nerdtree
" F6 开启/关闭语法高亮
" F5 相对/绝对行号
" F7 英文语法检查 todo ale检查
" Toggle spell check.
" map <F7> :setlocal spell!<CR>
" Paste mode toggle, it seems that Neovim's bracketed paste mode
" Toggle spell checking (autosave does not play well with z=, so we disable it
nnoremap <silent> <F7> :set spell! <bar> :AutoSaveToggle<cr>
inoremap <silent> <F7> <C-O>:set spell! <bar> :AutoSaveToggle<cr>
set pastetoggle=<F12>
" Toggle relative line numbers and regular line numbers.
nmap <F5> :set invrelativenumber<CR>

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>zz :ZoomToggle<CR>















