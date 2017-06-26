FROM rcl0ud/rcloud

# Note: If you're developing in windows make sure all
# Repositories are checked out with unix line endings
# > git config core.eol lf
# > git config core.autocrlf input
# Force on all files
# > git rm --cached -r .
# > git reset --hard
# Surely there's a better way?!

# Install JS dev dependencies

RUN apt-get update && apt-get install -y gnupg \
  && curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh \
  && rm nodesource_setup.sh \
  && apt-get update && apt-get install -y \
  nodejs=6*

RUN cd /data/rcloud \
  && npm install

# Remove old RCloud installation

# Copy out mathjax, might copy it back (or symlink)
RUN mkdir /save \
    && mv /data/rcloud/htdocs/mathjax /save/mathjax

# Put our own conf file in
ADD rcloud.conf /save/rcloud.conf
RUN chown -R rcloud:rcloud /save
ADD init.sh /bin/init.sh

EXPOSE 8080

WORKDIR /data/rcloud

ENTRYPOINT /bin/init.sh
