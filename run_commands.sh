# Launching the sold container
docker run -d -p 8983:8983 --name solr rcsolr

# Launching the RCloud container
docker run -d -p 8080:8080 --link solr:solr rcl0ud/rcloud

# Access solr via solr.url: http://solr:8983/solr/rcloudnotebooks
