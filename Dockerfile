# Specify a base image
FROM node:alpine

# Define the working directory of a Docker container
WORKDIR /usr/project

# Install ssh and git
RUN apk update
RUN apk add git
RUN apk add -qU openssh

# Get ssh public key for "github.com"
RUN mkdir -m 700 /root/.ssh; touch -m 600 /root/.ssh/known_hosts; ssh-keyscan github.com > /root/.ssh/known_hosts

# Clone the repository from GitHub
RUN --mount=type=ssh,id=github git clone git@github.com:simonsssssss/simpleweb.git

WORKDIR /usr/project/simpleweb

# Install some depenendencies
COPY ./package.json ./
RUN npm install
COPY ./ ./

# Listening on specific port
EXPOSE 1000

# Default command
CMD ["npm", "start"]  