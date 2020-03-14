# Image to work from
FROM alpine:latest

# Installation of Node.js & NPM
RUN apk add --update npm
# Group for the unpriviledged user
RUN addgroup -g 1000 -S user
# Unpriviledged user creation
RUN adduser -h /home/user -g "" -s /bin/sh -G user -S -D -u 1000 user

# Next commands will be run with this user
USER user

# Next commands will be run from this folder
WORKDIR /home/user

# Creating the folder for the unpriviledged user global command
RUN mkdir /home/user/.local
# Setting the folder where NPM should install the global packages
RUN npm config set prefix /home/user/.local
# Installing the Vue CLI in the global command folder
RUN npm install --global @vue/cli

# Adding the NPM's global commands to the environment path
ENV PATH=$PATH:/home/user/.local/bin

# Next commands will be run from this folder
WORKDIR /home/user/project

# Next commands run from this image will be prefixed with this command
ENTRYPOINT [ "vue" ]

# Next commands that do not have any argument will have this default argument instead
CMD [ "--help" ]

EXPOSE 8000
EXPOSE 8080
