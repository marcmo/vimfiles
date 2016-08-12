" Vim compiler file
" Compiler:	      enforcer
" Maintainer:	    Oliver Mueller
" Last Change:	  2016 July 7

if exists('current_compiler')
  finish
endif
let current_compiler = "enforcer"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
      \%f\,\ line\ %l:\ error:\ %m
" CompilerSet errorformat=
"       \%f:%l:%c:\ %t%*[^:]:\ %m,
"       \%f:%l:%c:\ %*\\d:%*\\d\ %t%*[^:]:\ %m,
"       \%-G%f:%l\ %s,
"       \%-G%*[\ ]^,
"       \%-G%*[\ ]^%*[~],
"       \%-G%*[\ ]...

let &cpo = s:cpo_save
unlet s:cpo_save


if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

if exists('g:enforcer_makeprg_params')
    execute 'CompilerSet makeprg=enforcer\ '.escape(g:enforcer_makeprg_params, ' \|"').'\ $*'
else
    CompilerSet makeprg=enforcer\ $*
endif

let s:enforcer_manifest_name = '.enforcer'

function! s:is_absolute(path)
    return a:path[0] == '/' || a:path =~ '[A-Z]\+:'
endfunction

let s:local_manifest = findfile(s:enforcer_manifest_name, '.;')
if s:local_manifest != ''
    let s:local_manifest = fnamemodify(s:local_manifest, ':p:h').'/'
    augroup enforcer
        au!
        au QuickfixCmdPost make call s:FixPaths()
    augroup END

    " FixPaths() is run after enforcer, and is used to change the file paths
    " to be relative to the current directory instead of .enforcer.
    function! s:FixPaths()
        let qflist = getqflist()
        let manifest = s:local_manifest
        for qf in qflist
            if !qf.valid
                let m = matchlist(qf.text, '(file://\(.*\))$')
                if !empty(m)
                    let manifest = m[1].'/'
                    " Manually strip another slash if needed; usually just an
                    " issue on Windows.
                    if manifest =~ '^/[A-Z]\+:/'
                        let manifest = manifest[1:]
                    endif
                endif
                continue
            endif
            let filename = bufname(qf.bufnr)
            if s:is_absolute(filename)
                continue
            endif
            let qf.filename = simplify(manifest.filename)
            call remove(qf, 'bufnr')
        endfor
        call setqflist(qflist, 'r')
    endfunction
endif

