#define build-test stage - docker multistage pipeline

FROM node:12 as build-test          

RUN docker scan --login --token 71ea9b33-ed8d-43cd-a625-d6c80375f81a
RUN docker scan build-test:latest 
#create app directory
WORKDIR /usr/app/

#install dependencies
COPY . .


RUN npm install && npm test
    
# run lean image
FROM node:12-alpine as run   
RUN docker scan run:latest 

#create app directory
WORKDIR /usr/app/

#install dependencies
COPY . .


RUN npm install && npm test

EXPOSE 3000

CMD ["node","index.js"]
