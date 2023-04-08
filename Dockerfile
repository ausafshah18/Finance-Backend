# syntax=docker/dockerfile:1

# Start your image with a node base image
FROM node:16.17.0

# Create an application directory
RUN mkdir -p /app

# Set the /app directory as the working directory for any command that follows
WORKDIR /app

# Copy the local app package and package-lock.json file to the container
COPY package*.json ./

# Copy local directories to the working directory of our docker image (/app)
COPY ./ ./

# Install node packages, install serve, build the app, and remove dependencies at the end
RUN npm install

    

# Specify that the application in the container listens on port 3000
EXPOSE 3000

# Start the app using serve command
CMD [ "node", "index.js" ]