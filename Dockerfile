FROM node:12-buster-slim

RUN apt-get update -qq \
    && apt-get install -y ca-certificates --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . ./

CMD ["npm", "start"]
