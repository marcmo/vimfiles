"============================================================================
"File:        cpp.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Gregor Uhlenheuer <kongo2002 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_cpp_dcc_checker')
    finish
endif
let g:loaded_syntastic_cpp_dcc_checker = 1

if !exists('g:syntastic_cpp_compiler_options')
    let g:syntastic_cpp_compiler_options = ''
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_cpp_dcc_IsAvailable() dict
    if !exists('g:syntastic_cpp_compiler')
        let g:syntastic_cpp_compiler = executable(self.getExec()) ? self.getExec() : 'clang++'
    endif
    call self.log('g:syntastic_cpp_compiler =', g:syntastic_cpp_compiler)
    return executable(expand(g:syntastic_cpp_compiler, 1))
endfunction

function! SyntaxCheckers_cpp_dcc_GetLocList() dict
    return syntastic#c#GetLocList('cpp', 'dcc', {
        \ 'errorformat':
        \     '%A"%f"\, line %l: %trror (etoa:%n): %m,' .
        \     '%A"%f"\, line %l: %tarning (etoa:%n): %m,' .
        \     '%A"%f"\, line %l: catastrophic %trror (etoa:%n): %m,' .
        \     '%A"%f"\, line %l: %tnfo (etoa:%n): %m,' .
        \     '%-G %#,' .
        \     '%Z%p^,' .
        \     '%-G%.%#',
        \ 'main_flags': '-c -S -Xlint',
        \ 'header_flags': '',
        \ 'header_names': '\m\.\(h\|hpp\|hh\)$' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'cpp',
    \ 'name': 'dcc',
    \ 'exec': 'dcc' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
