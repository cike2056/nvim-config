"{ Plugin installation
"{{ Vim-plug Install and related settings

" Auto-install vim-plug on different systems if it does not exist.
" For Windows, only Windows 10 with curl installed are supported (after
" Windows 10 build 17063, source: http://tinyurl.com/y23972tt).
" The following script to install vim-plug is adapted from vim-plug
" wiki: https://github.com/junegunn/vim-plug/wiki/tips#tips
if !executable('curl')
    echomsg 'You have to install curl to install vim-plug. Or install '
            \ . 'vim-plug yourself following the guide on vim-plug git repo'
else
    let g:VIM_PLUG_PATH = expand(stdpath('config') . '/autoload/plug.vim')
    if empty(glob(g:VIM_PLUG_PATH))
        echomsg 'Installing Vim-plug on your system'
        silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
            \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        augroup plug_init
            autocmd!
            autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        augroup END
    endif
endif

" Set up directory to install the plugins based on the platform
let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')
"}}

"{{ Autocompletion related plugins
call plug#begin(g:PLUGIN_HOME)
" fancy start screen for vim
Plug 'mhinz/vim-startify'
" Show marks in sign column for quicker navigation
" Plug 'kshenoy/vim-signature'
" Surround
Plug 'tpope/vim-surround'
" comment 注释 " # 
" make easy things easy 
"Plug 'tpope/vim-commentary' 
" Manage your yank history
" Plug 'svermeulen/vim-yoink'
" hightlight yank block
Plug 'machakann/vim-highlightedyank'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" markdown
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
" Distraction free writing
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" Only light on your cursor line to help you focus
Plug 'junegunn/limelight.vim', {'for': 'markdown'}
" Faster footnote generation
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': 'markdown' }
" Markdown JSON header highlight plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }
" text filtering and alignment
Plug 'godlygeek/tabular',{ 'on': [] } 
" Better file browser
Plug 'scrooloose/nerdtree',{ 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Autosave files on certain events
Plug '907th/vim-auto-save',{ 'on': [] }
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose',{ 'on': [] }
" Fold code
Plug 'tmhedberg/SimpylFold',{ 'on': [] }
" Additional powerful text object for vim, this plugin should be studied
" carefully to use its full power
Plug 'wellle/targets.vim',{ 'on': [] }
" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons',{ 'on': [] }
" git tools
Plug 'tpope/vim-fugitive',{ 'on': [] }
" Simulating smooth scroll motions with physcis
Plug 'yuttie/comfortable-motion.vim',{ 'on': [] }

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()



""""""""""""""""""""""""vim-auto-save settings""""""""""""""""""
" Enable autosave on nvim startup
let g:auto_save = 0
" A list of events to trigger autosave
let g:auto_save_events = ['InsertLeave', 'TextChanged']
" let g:auto_save_events = ['InsertLeave']
" Show autosave status on command line
let g:auto_save_silent = 0


"""""""""""""""""""""""vim-signature settings"""""""""""
" Change mark highlight to be more visible
augroup signature_highlight
autocmd!
autocmd ColorScheme * highlight SignatureMarkText cterm=bold ctermbg=10
    \ gui=bold guifg=#aeee04
augroup END

" ------------------- icons-----------------------
" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" -------------------NERDTree -----------------------------
" toggle erdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <leader>ff :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" Delete a file buffer when you have deleted it in nerdtree
let NERDTreeAutoDeleteBuffer = 1
" Disable bookmark and 'press ? for help' text
let NERDTreeMinimalUI=1
" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir
" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}


""""""""""""""""""""""""vim-markdownfootnotes settings""""""""""
" Replace the default mappings provided by the plugin
imap ^^ <Plug>AddVimFootnote
nmap ^^ <Plug>AddVimFootnote
imap @@ <Plug>ReturnFromFootnote
nmap @@ <Plug>ReturnFromFootnote

"""""""""""""""""""""""""goyo.vim settings""""""""""""""""""""""
" Make goyo and limelight work together automatically
augroup goyo_work_with_limelight
    autocmd!
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
augroup END
" -----------------markdown -------------------------------
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 1

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1



" -------------------fzf----------------------------------------
" floating window 不好用
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
nnoremap <silent><leader>ff :Files<CR>
nnoremap <A-f> :Files<CR>
nnoremap <silent><leader>fb :Buffers<CR>
nnoremap <A-b> :Buffers<CR>
nnoremap <silent><leader>fl :Lines<CR>
nnoremap <A-l> :Lines<CR>
nnoremap <silent><leader>fc :Colors<CR>
nnoremap <A-c> :Colors<CR>
nnoremap <silent><leader>fm :Maps<CR>
nnoremap <A-m> :Maps<CR>
nnoremap <silent><leader>ag :Ag<CR>
nnoremap <A-a> :Ag<CR>
nnoremap <A-h> :History<CR>
inoremap <A-h> <Esc>:History<CR>


