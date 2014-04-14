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

#desc 'Deploy Site Old'
#task :deploy_site_linode => :build_site do
#  sh 'rsync -azv --delete _site/ agilbert@www.agilbert.net://home/agilbert/Sites/c4ride.agilbert.net'
#end

# Note that we first rsync to local cache based on checksum
# to avoid resending large files to s3 every time. 
# jekyll copies too eagerly, and aws s3 sync doesn't appear to have checksum though s3 supports it (md5)
desc 'Deploy Site'
task :deploy_site => :build_site do
  sh 'rsync -azv --delete --checksum _site/ _site_cache'
  sh 'aws s3 sync _site_cache s3://c4ride.agilbert.net --delete'
end
