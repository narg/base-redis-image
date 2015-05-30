############################################################
# Dockerfile to build NARG Redis Image
# Based on NARG Base Image
############################################################

# Set the image
FROM narg/redis-docker-image:1.0 

MAINTAINER Necip Arg

WORKDIR /usr/src

# Install dependencies
RUN yum install -y tcl

# Clean up YUM
RUN yum clean all

# Download and extract Redis
RUN wget http://download.redis.io/releases/redis-3.0.1.tar.gz
RUN tar xzf redis-3.0.1.tar.gz

# Compile Redis
WORKDIR /usr/src/redis-3.0.1
RUN make

# Expose the Redis port
EXPOSE 6379
