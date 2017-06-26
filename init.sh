#!/bin/bash

sudo ln -s /save/mathjax /data/rcloud/htdocs/mathjax
sudo ln -s /data/rcloud.solr /data/rcloud/rcloud.packages/rcloud.solr
sudo cp /save/rcloud.conf /data/rcloud/conf/
sudo chown -R rcloud:rcloud /data/rcloud

sudo su - rcloud -c "cd /data/rcloud && scripts/build.sh --all"

sudo su - rcloud -c "ROOT=/data/rcloud /data/rcloud/conf/start"
sudo su - rcloud -c "/data/rcloud/docker/ulogd/ulogd /data/rcloud/run/ulog"
