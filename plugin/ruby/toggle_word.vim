" toggle_word.vim
"
" Vim global plugin for toggling words between true/false, yes/no, etc.
" Feedback is more than welcome :-)
"
" Last Change:  Mon Feb  5 13:53:09 EET 2007
" Maintainer:   Alexandru Ungur <alexandru@globalterrasoft.ro>
" License:      This file is placed in the public domain.
" Requires:     Vim6+, compiled with +ruby
" Version:      1.3

" some checks: version, if already loaded, if needed library is loaded already
if exists('loaded_toggle_word')
    echo "toggle_word.vim already loaded! won't reload."
    finish
endif

function! ToggleWord()
    let s:toggle_words = ['on', 'off', 'yes', 'no', 'true', 'false']
    let s:toggle_words = exists('g:toggle_words') ? 
        \ extend(s:toggle_words, s:toggle_words) : s:toggle_words
ruby << RUBY_DONE
class Array
  def upcase()     map{|e|e.upcase} end
  def capitalize() map{|e|e.capitalize} end
end

class String
  base = eval("%w[#{VIM::evaluate('s:toggle_words')}]")
  @@toggle = (t = Hash[*(base + base.upcase + base.capitalize)]).merge t.invert

  def toggle_word
    @@toggle[self] || @@toggle[downcase]
  end
end

tword = VIM::evaluate("expand('<cword>')").toggle_word
VIM::command("normal ciw#{tword}") unless tword.nil?
RUBY_DONE
endfunction

let loaded_toggle_word = "1.3"

command! ToggleWord :call ToggleWord() <CR>
" nmap <leader>t :call ToggleWord()<CR>
" vmap <leader>t <ESC>:call ToggleWord()<CR>
