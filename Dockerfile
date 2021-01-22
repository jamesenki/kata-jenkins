#base it on the public node12 image
FROM node:12-alpine

#create app directory
WORKDIR /usr/src/app

#install dependencies
COPY package*.json ./

#install npm
RUN npm install

#bundle app source and copy to image
COPY . .

#expose port 3000 on container
EXPOSE 3000

#start the app
CMD ["node","index.js"]
