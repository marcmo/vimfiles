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
  sh 'echo -e "source ~/.vim/_vimrc_universal\\nsource ~/.vim/_vimrc_linux" > ~/.vimrc2'
end
