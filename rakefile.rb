
Plugins = [
  'surround',
  'vim-repeat',
  'vim-rails'
]

desc "update plugins: #{Plugins.inject("") {|acc,p| "#{acc} #{p}"} }"
task :update do
  Plugins.each do |p|
    cd "bundle/#{p}" do
      sh "git pull"
    end
  end
end
