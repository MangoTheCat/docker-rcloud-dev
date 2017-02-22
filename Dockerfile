FROM rcl0ud/rcloud

# Note: If you're developing in windows make sure all
# Repositories are checked out with unix line endings
# > git config core.eol lf
# > git config core.autocrlf input
# Force on all files
# > git rm --cached -r .
# > git reset --hard
# Surely there's a better way?!

# Remove old RCloud installation

RUN mv /data/rcloud/htdocs/mathjax /mathjax \
    && rm -rf /data/rcloud


# Copy in the new rcloud files
# @TODO shouldn't these be mounted not added?
ADD rcloud /data/rcloud
ADD rcloud.solr /data/rcloud/rcloud.packages/rcloud.solr

# @TODO Copy the docker html files somewhere and then get init.sh to symlink.

# Put mathjax back
RUN mv /mathjax /data/rcloud/htdocs/

# Put our own conf file in
ADD docker-rcloud-dev/rcloud.conf /data/rcloud/conf/rcloud.conf

RUN chown -R rcloud:rcloud /data/rcloud

RUN cd /data/rcloud && git apply docker/domainCookie.patch
RUN cd /data/rcloud \
         && scripts/build.sh --all

# @TODO Add npm and grunt?

EXPOSE 8080

WORKDIR /data/rcloud
#ENTRYPOINT /bin/init.sh
ENTRYPOINT bash
