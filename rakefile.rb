
Plugins = Dir.glob("bundle/*").each do |b|
  b.gsub!(/bundle\//,'')
end

desc "update plugins: [#{Plugins.join(",")}]"
task :update do
  Plugins.each do |p|
    cd "bundle/#{p}" do
      sh "git pull"
    end
  end
end
