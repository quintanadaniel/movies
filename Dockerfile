# pull official base image
FROM node:13.12.0-alpine
RUN apk add --no-cache git
RUN git --version
ENV NODE_ENV=development NODE_PATH=/app
# set working directory
WORKDIR /app
COPY package.json .
COPY package-lock.json .
COPY . .
COPY node_modules /node_modules
RUN npm install
# start app
CMD ["npm", "start"]