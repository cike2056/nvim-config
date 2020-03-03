
" Status line""""""""""""""""""""""""""""""""""""""""""""""
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom Mode
let g:mode_hl = {
    \ 'n'        : ['Normal', 'Normal'],     'no'     : ['Normal', 'N·Operator Pending'],
    \ 'v'        : ['Visual', 'Visual'],     'V'      : ['Visual', 'V·Line'],
    \ "\<c-v>"   : ['Visual', 'V·Block'],    's'      : ['Visual', 'Select'],
    \ 'S'        : ['Visual', 'S·Line'],     "\<c-s>" : ['Visual', 'S·Block'],
    \ 'i'        : ['Insert', 'Insert'],     'ic'     : ['Insert', 'I·Compl'],
    \ 'ix'       : ['Insert', 'I·X Compl'],  'R'      : ['Replace', 'Replace'],
    \ 'Rc'       : ['Replace', 'R·Compl'],   'Rv'     : ['Replace', 'R·Virtual'],
    \ 'Rx'       : ['Replace', 'R·X Compl'], 'c'      : ['Command','Command'],
    \ 'cv'       : ['Term','Vim Ex'],        'ce'     : ['Term','Ex'],
    \ 'r'        : ['Prompt','Prompt'],      'rm'     : ['Prompt','More'],
    \ 'r?'       : ['Prompt','Confirm'],     '!'      : ['Term','Shell'],
    \ 't'        : ['Term','Terminal']}

let s:ins = {'i':'i', 'r':'R','v':'Rv'}

" Colors are [gui , cterm]
" norm=blue, ins=Green, vis=yellow, rep=red, com=cyan, prom=Magenta, term=white
let s:pallet = {
    \ 'Normal'  : ['#597bc5', '4'],  'Insert'  : ['#99ad6a', '2'],
    \ 'Visual'  : ['#d8ad4c', '3'],  'Replace' : ['#cf6a4c', '1'],
    \ 'Command' : ['#71b9f8', '14'], 'Prompt'  : ['#a037b0', '5'],
    \ 'Term'    : ['#adadad', '7']}

let s:modecache = ''
function! ChangeColor(curmode)
    let s:hlmode = g:mode_hl[a:curmode][0]
    if s:modecache == s:hlmode
        return ''
    endif
    let s:modecache = s:hlmode
    let [s:color1, s:color2] = s:pallet[s:hlmode]
    if &term =~ 'linux'
        let s:mode_color = printf(' guifg=#1c1c1c guibg=%s ctermfg=black ctermbg=%s', s:color1, s:color2)
        let s:accent_color = printf(' guifg=%s guibg=#1c1c1c ctermfg=%s ctermbg=black', s:color1, s:color2)
    else
        let s:mode_color = printf(' gui=bold guifg=#1c1c1c guibg=%s cterm=bold ctermfg=234 ctermbg=%s', s:color1, s:color2)
        let s:accent_color = printf(' guifg=%s guibg=#1c1c1c ctermfg=%s ctermbg=234', s:color1, s:color2)
    endif
    execute 'highlight StlMode'.s:mode_color
    execute 'highlight StlText'.s:accent_color
    return ''
endfunction

function! SetCustomColors()
    if &term=~'linux'
        execute 'hi statusline ctermfg=black ctermbg=white'
        execute 'hi StlText ctermfg=4 ctermbg=black'
        execute 'hi statuslinenc ctermfg=white ctermbg=black'
        execute 'hi Visual cterm=reverse'
        execute 'hi User1 ctermfg=white ctermbg=black'
        execute 'hi User2 ctermfg=red ctermbg=black'
        execute 'hi User3 ctermfg=yellow ctermbg=black'
        execute 'hi User4 ctermfg=white ctermbg=black'
    else
        execute 'hi statusline gui=bold ctermfg=234 ctermbg=7 guibg=#adadad guifg=#1c1c1c'
        execute 'hi StlText guifg=#597bc5 guibg=#1c1c1c ctermfg=4 ctermbg=234'
        execute 'hi statuslinenc gui=bold guifg=#adadad guibg=#1c1c1c ctermfg=007 ctermbg=234'
        execute 'hi Visual guifg=#1c1c1c guibg=#d8ad4c ctermfg=0 ctermbg=3'
        execute 'hi User1 ctermfg=007 ctermbg=237 guibg=#3b3b3b guifg=#adadad'
        execute 'hi User2 ctermfg=001 ctermbg=234 guibg=#1c1c1c guifg=#cf6a4c'
        execute 'hi User3 ctermfg=011 ctermbg=234 guibg=#1c1c1c guifg=#d8ad4c'
        execute 'hi User4 guifg=#adadad guibg=#1c1c1c ctermfg=007 ctermbg=234'
    endif
endfunction

augroup Statusline
    autocmd!
    autocmd CursorHold,CursorHoldI,InsertLeave,BufWritePost * unlet! b:statusline_trailing_space_warning
    autocmd InsertEnter,InsertChange * call ChangeColor(s:ins[v:insertmode])
    autocmd InsertLeave,VimEnter,Colorscheme * call ChangeColor(mode(1))
    autocmd VimEnter,ColorScheme * call SetCustomColors()
    autocmd VimEnter,WinEnter,BufWinEnter,CmdwinEnter,Colorscheme * call UpdateStl()
    if exists('#CmdlineLeave')
        autocmd CmdlineLeave * call UpdateStl()
    endif
augroup end

" See :help statusline for codes
let g:stl = [
    \ '%*%{ChangeColor(mode(1))}',
    \ '%1*',
    \ '%#StlMode#',
    \ ' %{g:mode_hl[mode()][1]} ',
    \ '%1* %n %Y %4*',
    \ '%#StlText#',
    \ ' %<%F ',
    \ '%2*%M ',
    \ '%2*%{&readonly?''RO '':''''}',
    \ '%2*%{&spell?'' Spell '':''''}',
    \ '%=',
    \ '%#StlText#',
    \ ' %{&fenc!=''''?&fenc:&enc}',
    \ ' [%{&ff}] ',
    \ '%1* col: %-02v ',
    \ '%#StlMode#',
    \ ' ≡ %-03l/%L %3p%% '
\]

let g:stl_ia = filter(copy(g:stl), { _,s -> s !~# '%#\|ChangeColor' })

function! UpdateStl()
    let l:wina = winnr()
    let l:stls = [join(g:stl_ia, ''), join(g:stl, '')]
    for l:winnr in range(1, winnr('$'))
        call setwinvar(l:winnr, '&statusline', l:stls[l:winnr ==# l:wina])
    endfor
endfunction

" theme"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if $TERM == "xterm-256color" || exists('g:started_by_firenvim')
"     set termguicolors
" endif
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

" gruvbox8_hard ---------------------
let g:gruvbox_italics=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_filetype_hi_groups = 0
let g:gruvbox_plugin_hi_groups = 0
colorscheme gruvbox8_hard
" gruvbox hard --------------
" colorscheme gruvbox
" let g:gruvbox_contrast_dark="hard"

