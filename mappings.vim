let mapleader=","
nnoremap ; :
xnoremap ; :

" editor
noremap <Leader>y "+y
nmap <Leader>p "+p
imap qq <Esc>:q!<CR>
" nmap q :q!<CR>
nmap q :q!<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <Leader>w :w<CR>
nmap QA :qa!<CR>
" save and quit
nmap QQ ZZ
imap QQ <Esc>ZZ

" 2x scroll speed
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <C-j> 5<C-e>
nnoremap <C-k> 5<C-y>

imap ii <Esc>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <Del>
nnoremap [     0
nnoremap ]     $
noremap <Home>    0
noremap <End>     $
" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" 缩退
xnoremap < <gv
" 缩进 v :1,20>
xnoremap > >gv
" 搜索
nmap <space> /
nmap <space><space> ?
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

" clear search results
nnoremap <silent> // :noh<CR>

" F1 F4 F10 F11 已经占用
" F2 开启/关闭行号
" F3 nerdtree
" F6 开启/关闭语法高亮
" F5 相对/绝对行号
" F7 英文语法检查 todo ale检查
" Toggle spell check.
map <F7> :setlocal spell!<CR>
" Paste mode toggle, it seems that Neovim's bracketed paste mode
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


" -------------------------------------------test-----
" Quicker <Esc> in insert mode
inoremap <silent> jk <Esc>

" Turn the word under cursor to upper case
inoremap <silent> <c-u> <Esc>viwUea

" Turn the current word into title case
inoremap <silent> <c-t> <Esc>b~lea

" Paste non-linewise text above or below current cursor,
" see https://stackoverflow.com/a/1346777/6064933
nnoremap <leader>p m`o<ESC>p``
nnoremap <leader>P m`O<ESC>p``

" Shortcut for faster save and quit
nnoremap <silent> <leader>w :update<CR>
" Saves the file if modified and quit
nnoremap <silent> <leader>q :x<CR>
" Quit all opened buffers
nnoremap <silent> <leader>Q :qa<CR>

" Navigation in the location and quickfix list
nnoremap [l :lprevious<CR>zv
nnoremap ]l :lnext<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap [q :cprevious<CR>zv
nnoremap ]q :cnext<CR>zv
nnoremap [Q :cfirst<CR>zv
nnoremap ]Q :clast<CR>zv

" Close location list or quickfix list if they are present,
" see https://goo.gl/uXncnS
nnoremap<silent> \x :windo lclose <bar> cclose<CR>

" Close a buffer and switching to another buffer, do not close the
" window, see https://goo.gl/Wd8yZJ
nnoremap <silent> \d :bprevious <bar> bdelete #<CR>

" Toggle search highlight, see https://goo.gl/3H85hh
nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Disable arrow key in vim, see https://goo.gl/s1yfh4.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> oo 'm`' . v:count1 . 'o<Esc>``'
nnoremap <expr> OO 'm`' . v:count1 . 'O<Esc>``'

" nnoremap oo @='m`o<c-v><Esc>``'<cr>
" nnoremap OO @='m`O<c-v><Esc>``'<cr>

" the following two mappings work, but if you change double quote to single, it
" will not work
" nnoremap oo @="m`o\<lt>Esc>``"<cr>
" nnoremap oo @="m`o\e``"<cr>

" Insert a space after current character
nnoremap <silent> <Space><Space> a<Space><ESC>h

" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Move the cursor based on physical lines, not the actual lines.
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://goo.gl/PkuZox
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Resize windows using <Alt> and h,j,k,l, inspiration from
" https://goo.gl/vVQebo (bottom page).
" If you enable mouse support, shorcuts below may not be necessary.
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+

" Fast window switching, inspiration from
" https://stackoverflow.com/a/4373470/6064933
nnoremap <silent> <M-left> <C-w>h
nnoremap <silent> <M-right> <C-w>l
nnoremap <silent> <M-down> <C-w>j
nnoremap <silent> <M-up> <C-w>k

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://goo.gl/m1UeiT
xnoremap < <gv
xnoremap > >gv

" When completion menu is shown, use <cr> to select an item
" and do not add an annoying newline. Otherwise, <enter> is what it is.
" For more info , see https://goo.gl/KTHtrr and https://goo.gl/MH7w3b
inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" Use <esc> to close auto-completion menu
inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Nvim config successfully reloaded!"<cr>

" Reselect the text that has just been pasted
nnoremap <leader>v `[V`]

" Use sane regex expression (see `:h magic` for more info)
nnoremap / /\v

" Find and replace (like Sublime Text 3)
nnoremap <C-R> :%s/
xnoremap <C-R> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Use Esc to quit builtin terminal
tnoremap <ESC>   <C-\><C-n>

" Toggle spell checking (autosave does not play well with z=, so we disable it
" when we are doing spell checking)
nnoremap <silent> <F11> :set spell! <bar> :AutoSaveToggle<cr>
inoremap <silent> <F11> <C-O>:set spell! <bar> :AutoSaveToggle<cr>

" Decrease indent level in insert mode with shift+tab
inoremap <S-Tab> <ESC><<i

" Change text without putting the text into register,
" see http://tinyurl.com/y2ap4h69
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Remove trailing whitespace characters
nnoremap <silent> <leader><Space> :call utils#StripTrailingWhitespaces()<CR>

" check the syntax group of current cursor position
nnoremap <silent> <leader>st :call utils#SynGroup()<CR>
