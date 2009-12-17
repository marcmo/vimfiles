""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autohi.vim - If cursor stops for a while under some word that doesn't belong to the
" current syntax, highlight it. (similar behavior found on Eclipse)
" Version: 0.2
" Author: Adam Duck <duck@cs.uni-frankfurt.de>
" Maintainer: Thiago Alves <thiago.salves@gmail.com>
" URL: http://www.vim.org/scripts/script.php?script_id=1510
" Licence: This script is released under the Vim License.
" Last modified: 09/03/2007 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("g:AutoHiVersion")
    finish
endif
let g:AutoHiVersion="0.2"
let s:loading = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:AutoHighlight()
    if exists("b:current_syntax") && (strpart(getline('.'), col('.') - 1, 1) =~ '\S')
        if synIDattr(synID(line("."), col("."), 1), "name") == ""
            let cword=expand("<cword>")
            if cword =~ '\<\*\?\h\w*'
                execute 'match AutoHiGroup /\<'.cword.'\>/'
            endif
        endif
    endif
endfunction

function! s:ToggleAutoHighlight()
    let s:DoHighlight = !s:DoHighlight
    if !s:DoHighlight
        match none
        autocmd! AutoHighlight
        if !exists("s:loading")
            echo "Autohighlight OFF"
        endif
    else
        autocmd AutoHighlight CursorHold * :call <SID>AutoHighlight()
        if !exists("s:loading")
            echo "Autohighlight ON"
        endif
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if there is no color defined to AutoHiGroup, define it
if !hlexists("AutoHiGroup")
    hi AutoHiGroup guibg=#708090     guifg=#f0e68c
endif

" let user define if AutoHighlight will start ON or OFF
if exists("g:AutoHighlightInitialStatus")
    let s:DoHighlight = g:AutoHighlightInitialStatus
    unlet g:AutoHighlightInitialStatus
else
    let s:DoHighlight = 1
endif

" clear every possible garbage in the AutoHighlight command group
augroup AutoHighlight
    au!
augroup END

" commands to turn AutoHighlight ON and OFF
command! AutoHighlightToggle :call <SID>ToggleAutoHighlight()
command! AHToggle :call <SID>ToggleAutoHighlight()

" if AutoHighlight should be turned on, turn it on!
if s:DoHighlight
    let s:DoHighlight = 0
    call s:ToggleAutoHighlight()
endif

unlet s:loading

