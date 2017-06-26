# Launching the sold container
docker run -d -p 8983:8983 --name solr rcsolr

# Launching the RCloud container
docker run -d -p 8080:8080 --link solr:solr rcl0ud/rcloud

# With the mounting
docker run -it -p 8080:8080 -v rcloud:/data/rcloud -v rcloud.support:/data/rcloud/rcloud.packages/rcloud.support rcdev

docker run -it -p 8080:8080 --rm -v /c/Users/dashton.Mango/Documents/Projects/ATT/rcloud:/data/rcloud -v /c/Users/dashton.Mango/Documents/Projects/ATT/rcloud.solr:/data/rcloud.solr rcdev
# Access solr via solr.url: http://solr:8983/solr/rcloudnotebooks
