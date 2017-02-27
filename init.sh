#!/bin/bash

sudo chown -R rcloud:rcloud /data/rcloud

sudo su - rcloud -c "cd /data/rcloud && scripts/build.sh --all"
sudo su - rcloud -c "cd /data/rcloud && git apply docker/domainCookie.patch"

sudo su - rcloud -c "ROOT=/data/rcloud /data/rcloud/conf/start"
sudo su - rcloud -c "/data/rcloud/docker/ulogd/ulogd /data/rcloud/run/ulog"
