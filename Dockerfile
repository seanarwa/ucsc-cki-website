# base image
FROM node:11.10.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
ENV PORT=$PORT

# install and cache app dependencies
COPY . /app/

RUN npm install --silent && \
    npm run-script build && \
    rm -r src/ && \
    rm Dockerfile yarn.lock && \
    ls

EXPOSE $PORT

# start app
CMD ["node", "server.js"]