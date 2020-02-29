"{ Colorscheme and highlight settings
"{{ General settings about colors
" Enable true colors support. Do not use this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://bit.ly/2InF97t.
if $TERM == "xterm-256color" || exists('g:started_by_firenvim')
    set termguicolors
endif
" open true color
if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif
" Use dark background
set background=dark
"}}


if utils#HasColorscheme('gruvbox8')
    let g:gruvbox_italics=1
    let g:gruvbox_italicize_strings=1
    let g:gruvbox_filetype_hi_groups = 0
    let g:gruvbox_plugin_hi_groups = 0
    colorscheme gruvbox8_hard
else
    colorscheme gruvbox
endif

""""""""""""""""""""""""""" deus settings"""""""""""""""""""""""""""""""""
" colorscheme deus

""""""""""""""""""""""""""" solarized8 settings"""""""""""""""""""""""""
" Solarized colorscheme without bullshit
" let g:solarized_term_italics=1
" let g:solarized_visibility="high"
" colorscheme solarized8_high

""""""""""""""""""""""""""" vim-one settings"""""""""""""""""""""""""""""
" let g:one_allow_italics = 1
" colorscheme one

"""""""""""""""""""""""""""material.vim settings""""""""""""""""""""""""""
" let g:material_terminal_italics = 1
" " theme_style can be 'default', 'dark' or 'palenight'
" let g:material_theme_style = 'dark'
" colorscheme material

""""""""""""""""""""""""""" badwolf settings """""""""""""""""""""""""""""
" let g:badwolf_darkgutter = 0
" " Make the tab line lighter than the background.
" let g:badwolf_tabline = 2
" colorscheme badwolf
"}}
"}



"""""""""""""""""""""""""""vim-airline setting""""""""""""""""""""""""""""""
" Set airline theme to a random one if it exists
let s:candidate_airlinetheme = ['ayu_mirage', 'base16_flat',
    \ 'base16_grayscale', 'lucius', 'base16_tomorrow', 'ayu_dark',
    \ 'base16_adwaita', 'biogoo', 'distinguished', 'jellybeans',
    \ 'luna', 'raven', 'term', 'vice', 'zenburn', 'tomorrow']

let s:idx = utils#RandInt(0, len(s:candidate_airlinetheme)-1)
let s:theme = s:candidate_airlinetheme[s:idx]

if utils#HasAirlinetheme(s:theme)
    let g:airline_theme=s:theme
endif

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s. '

" Whether to show function or other tags on status line
let g:airline#extensions#tagbar#enabled = 1

" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

" Whether to use powerline symbols, see https://goo.gl/XLY19H.
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'

" Only show git hunks which are non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" Speed up airline
let g:airline_highlighting_cache = 1
