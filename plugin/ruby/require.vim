function! TestMe()
ruby << EOF
def open_require(open_type)
  print "Hello"
  case open_type
  when 'e' then open_command = 'edit'
  when 's' then open_command = 'split'
  else open_command = 'tabnew'
  end
  cb = VIM::Buffer.current
  line = VIM::Buffer.current.line 
  num = VIM::Buffer.current.line_number
  cur_line = cb.line
  "test".chomp
  print "split up -> #{line.split('require ')}"
  print "Hello Again! #{line} #{num} #{cb.line} ending..."
  print "hhhohoh"
  file = 'date.rb'
#  file = (cur_line.split('require ')[1].chomp)[1..-2] + '.rb'
  $LOAD_PATH.each {|path|
    if File.exist?(path + '/' + file) then
      VIM::command("#{open_command} #{path + '/' + file}")
    end
  }
end
open_require('t')
EOF
 echo "testme was called"
endfunction

command! TestMe :call TestMe() <CR>
nmap <leader>q :call TestMe()<CR>

" VIM::command("function! OpenRequire(open)
"                 ruby open_require(VIM::evaluate('a:open'))
"               endfunction")
