" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Turn on/off with z/ (or key of your choice)
map z/ :call Auto_Highlight_Toggle()<CR>

function! Auto_Highlight_Cword()
  exe "let @/='\\<".expand("<cword>")."\\>'"
endfunction

function! Auto_Highlight_Toggle()
  if exists("#CursorHold#*")
    au! CursorHold *
    let @/=''
  else
    set hlsearch
    set updatetime=500
    au! CursorHold * nested call Auto_Highlight_Cword()
  endif
endfunction

