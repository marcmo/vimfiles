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

task :vundle do
  vundleDir = File.join(VimDir,"bundle","vundle")
  sh "git clone https://github.com/gmarik/vundle.git #{vundleDir}"
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

