FROM node:slim

# Declaring env
ENV NODE_ENV production

# Setting up the work directory
WORKDIR /express-docker

# Copying all the files in our project
COPY . .

# Installing dependencies
RUN apt update && apt upgrade
RUN apt install openssl -y
RUN npm install
RUN npx prisma generate

# Starting our application
CMD npx node index.js

# Exposing server port
EXPOSE 3000

