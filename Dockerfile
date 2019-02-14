FROM node:alpine

# Create directory
RUN mkdir /consul-assets
WORKDIR /consul-assets

# Variables
ENV NODE_ENV production

# Install
COPY . /consul-assets

RUN npm install .
EXPOSE 8080
CMD ["node", "index.js"]
