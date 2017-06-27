# docker-rcloud-dev

> A Docker image for developing with RCloud

## Installation

Get Docker for your platform.

From the command line, with your Docker deamon running, enter

```sh
docker pull mangothecat/rcloud-dev
```

The image is based on the official `rcl0ud/rcloud` image and makes a few tweaks to aid development. That image is based on Debian Jessie.

## Usage

This Docker image is designed for someone who is developing RCloud code. To that end you will have a repository checked out from [https://github.com/att/rcloud](https://github.com/att/rcloud) or your own fork.

### Running the container

Make sure your working directory is the root of the rcloud repository. Launch a container making sure to map port `8080` back to your local host.

```sh
docker run -d -p 8080:8080 --rm -v </path/to/rcloudrepo>:/data/rcloud -v rcdev
```

and with other packages you are developing similarly mounted. Linux and Mac users can just use `-v .:/data/rcloud` but that never seems to work for me from standard Windows shells.

Once launched the container will run the `scripts/build.sh` script that rebuilds the javascript and the R packages. This can take up to a minute and so there will be a delay before RCloud comes up. When it's done go to:

```
http://localhost:8080/login.R
```

And then you can start you RCloud testing.

### Windows Users

There is a `.gitattributes` file that should ensure files are checked out with Linux line endings. Try to keep this when creating new files with Windows. When they are mounted into Linux Windows line endings can cause problems in the container.

## Docker Compose

The easiest way to run RCloud is with a `docker-compose` file. This lets you set up a group of containers and volumes without specifying everything as a command line option. This is particularly useful if you are also running a solr instance from [https://github.com/mangothecat/docker-rcloud-solr](mangothecat/docker-rcloud-solr). An example docker-compose is in this repo.

