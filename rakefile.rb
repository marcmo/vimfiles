def windows?
  (RUBY_PLATFORM =~ /cygwin|mswin|mingw|bccwin|wince|emx/) != nil
end
def mac?
  (RUBY_PLATFORM =~ /darwin/) != nil
end
def unix?
  !windows?
end
def linux?
  unix? and not mac?
end

UserDir = File.expand_path('~')
VimDir = File.join(UserDir,".vim")

task :plugged do
  mkdir_p "#{UserDir}/.vim/autoload"
  plug_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  sh "curl -fLo ~/.vim/autoload/plug.vim #{plug_url}"
end

desc "install plugins"
task :install => :plugged do
  begin
    sh "vim +PlugInstall +qall"
  rescue
  end
end

desc "link"
task :link do
  vimrc = "#{UserDir}/.vimrc"
  raise "#{vimrc} already exists!" if File.exists?(vimrc)
  targetRc = mac? ? "mac" : linux? ? "linux" : "windows"
  universal = File.join(VimDir,"_vimrc_universal")
  osSpecific = File.join(VimDir,"_vimrc_#{targetRc}")
  File.open(vimrc, 'w') do |f|
    f.puts("source #{universal}")
    f.puts("source #{osSpecific}")
  end
end

