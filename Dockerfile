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

# Copy out mathjax, might copy it back (or symlink)
RUN mkdir /save \
    && mv /data/rcloud/htdocs/mathjax /save/mathjax

# Put our own conf file in
ADD docker-rcloud-dev/rcloud.conf /save/rcloud.conf
RUN chown -R rcloud:rcloud /save
ADD docker-rcloud-dev/init.sh /bin/init.sh

EXPOSE 8080

WORKDIR /data/rcloud
#ENTRYPOINT /bin/init.sh
ENTRYPOINT bash
