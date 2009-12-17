def open_require(open_type)
  case open_type
  when 'e' then open_command = 'edit'
  when 's' then open_command = 'split'
  else open_command = 'tabnew'
  end
  cb = VIM::Buffer.current
  cur_line = cb.line
  file = (cur_line.split('require ')[1].chomp)[1..-2] + '.rb'
  $LOAD_PATH.each {|path|
    if File.exist?(path + '/' + file) then
      VIM::command("#{open_command} #{path + '/' + file}")
    end
  }
end

VIM::command("function! OpenRequire(open)
                ruby open_require(VIM::evaluate('a:open'))
              endfunction")

