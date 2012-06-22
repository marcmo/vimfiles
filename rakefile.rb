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


task :vundle do
  sh "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
end

desc "install plugins"
task :install => :vundle do
  sh "vim +BundleInstall +qall"
end

desc "link"
task :link do
  userDir = File.expand_path('~')
  vimrc = "#{userDir}/.vimrc"
  raise "#{vimrc} already exists!" if File.exists?(vimrc)
  targetRc = mac? ? "mac" : linux? ? "linux" : "windows"
  File.open(vimrc, 'w') do |f|
    f.puts("source #{userDir}/.vim/_vimrc_universal")
    f.puts("source #{userDir}/.vim/_vimrc_#{targetRc}")
  end
end

