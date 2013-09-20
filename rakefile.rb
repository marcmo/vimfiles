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
  userDir = File.expand_path('~')
  sh "git clone https://github.com/gmarik/vundle.git #{File.join(userDir,".vim","bundle","vundle")}"
end

desc "install plugins"
task :install => :vundle do
  begin
    sh "vim +BundleInstall +qall"
  rescue
  end
end

desc "link"
task :link do
  userDir = File.expand_path('~')
  vimrc = "#{userDir}/.vimrc"
  raise "#{vimrc} already exists!" if File.exists?(vimrc)
  targetRc = mac? ? "mac" : linux? ? "linux" : "windows"
  universal = File.join(userDir,'.vim','_vimrc_universal')
  osSpecific = File.join(userDir,'.vim',"_vimrc_#{targetRc}")
  File.open(vimrc, 'w') do |f|
    f.puts("source #{universal}")
    f.puts("source #{osSpecific}")
  end
end

