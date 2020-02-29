" ------------------Builtin options and settings
set cmdheight=1
set shortmess=aiT
" you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first
set hidden
set foldmethod=manual
"set nofoldenable

" change filechar for folding, vertical split, and message sepator
set fillchars=fold:\ ,vert:\│,msgsep:‾


" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://goo.gl/vHvyu8 for more info
set timeoutlen=1000

" For CursorHold events
set updatetime=2000

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://goo.gl/YAHBbJ
set clipboard+=unnamedplus

" Disable creating swapfiles, see https://goo.gl/FA6m6h
set noswapfile

" Set up backup directory
let g:backupdir=expand(stdpath('data') . '/backup')
if !isdirectory(g:backupdir)
   call mkdir(g:backupdir, "p")
endif
let &backupdir=g:backupdir

set backupcopy=yes  " copy the original file to backupdir and overwrite it

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」

" Show line number and relative line number
set number relativenumber

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
scriptencoding utf-8

" List all items and start selecting matches in cmd completion
set wildmode=list:full

" Show current line where the cursor is
set cursorline
" Set a ruler at column 80, see https://goo.gl/vEkF5i
set colorcolumn=80

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Use mouse to select and resize windows, etc.
set mouse=nic  " Enable mouse in several mode
set mousemodel=popup  " Set the behaviour of mouse

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Fileformats to use for new files
set fileformats=unix,dos

" The way to show the result of substitution in real time for preview
set inccommand=nosplit

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Do not use visual and errorbells
set visualbell noerrorbells

" The level we start to fold
set foldlevel=3

" The number of command and search history to keep
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+

" Auto-write the file based on some condition
set autowrite

" Show hostname, full path of file and last-mod time on the window title.
" The meaning of the format str for strftime can be found in
" http://tinyurl.com/l9nuj4a. The function to get lastmod time is drawn from
" http://tinyurl.com/yxd23vo8
set title
set titlestring=
set titlestring+=%(%{hostname()}\ \ %)
set titlestring+=%(%{expand('%:p')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Persistent undo even after you close a file and re-open it
set undofile

" Do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c

" Completion behaviour
" set completeopt+=noinsert  " Auto select the first completion entry
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
" Settings for popup menu
set pumheight=15  " Maximum number of items to show in popup menu

" Scan files given by `dictionary` option
set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t

" Dictionary files for different systems
let g:MY_DICT = expand(g:nvim_config_root . '/dict/words')
let &dictionary = &dictionary . ',' . g:MY_DICT

set spelllang=en,cjk  " Spell languages
set spellsuggest+=10  " The number of suggestions shown in the screen for z=

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://tinyurl.com/y5n87a6m
set shiftround

" Virtual edit is useful for visual block edit
set virtualedit=block

" Correctly break multi-byte characters such as CJK,
" see http://tinyurl.com/y4sq6vf3
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" Do not add two space after a period when joining lines or formatting texts,
" see https://tinyurl.com/y3yy9kov
set nojoinspaces

" Text after this column number is not highlighted
set synmaxcol=500

set nostartofline


" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        " call setline(1, "\#!/usr/bin/env python")
        " call append(1, "\# encoding: utf-8")
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

"让vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

set shell=/usr/bin/zsh 

" 打开上次关闭文件的位置
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



