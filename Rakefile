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

desc 'Deploy Site'
task :deploy_site_s3 => :build_site do
  sh 'aws s3 sync _site s3://c4ride.agilbert.net --delete'
end

desc 'Deploy Site'
task :deploy_site => :build_site do
  sh 'rsync -azv --delete _site/ agilbert@www.agilbert.net://home/agilbert/Sites/ridetheridges.cabotconnects.org'
end
