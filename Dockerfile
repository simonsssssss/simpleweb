# Specify a base image
FROM node:alpine

WORKDIR /usr/app

# Install some depenendencies
RUN apk update
RUN apk add git
RUN apk add -qU openssh

RUN mkdir -m 700 /root/.ssh; \
  touch -m 600 /root/.ssh/known_hosts; \
  ssh-keyscan github.com > /root/.ssh/known_hosts

RUN --mount=type=ssh,id=github git clone git@github.com:simonsssssss/simpleweb.git

WORKDIR /usr/app/myrepository/Simpleweb

EXPOSE 3000
# Default command
CMD ["npm", "start"]  