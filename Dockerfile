#define build-test stage - docker multistage pipeline

FROM node:12 as build-test          

#create app directory
WORKDIR /usr/app

#install dependencies
COPY . .

RUN npm install-test
    
# run lean image
FROM node:12-alpine as run    

#create app directory
WORKDIR /usr/app

#install dependencies
COPY . .

RUN npm install

EXPOSE 3000

CMD ["node","index.js"]
