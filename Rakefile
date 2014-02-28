require "bundler/setup"

Bundler.require

require "yaml"
 
desc 'Generate Dev Site'
task :build_site do
  Jekyll::Site.new(Jekyll.configuration({
    "source" => ".",
    "destination" => "_site",
    "baseurl" => "http://c4ride.agilbert.net"
  })).process
end

desc 'Deploy Dev Site'
task :deploy_site => :build_site do
  sh 'rsync -azv --delete _site/ agilbert@www.agilbert.net://home/agilbert/Sites/c4ride.agilbert.net'
end
