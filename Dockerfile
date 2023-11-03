FROM node

# make the 'app' folder the current working directory
WORKDIR /skaffaleapp

# create client
COPY ./client/package*.json ./
RUN npm install
COPY ./client ./
RUN npm run build

# create server
COPY ./server/package*.json ./
RUN npm install
COPY ./server ./

CMD ["node", "app.js"]