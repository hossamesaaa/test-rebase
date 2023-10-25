#FROM node:18
FROM node:20-slim

#    WEBport # Web app port, (optional) default: 3000
#    DBuser # MongoDB user, (required) example: test
#    DBpass # MongoDB pass, (required) example: test123
#    DBhosts # MongoDB host(s):port(s), (required) example: "mongo-0.mongo:27017" or 
#    "mongo-0.mongo:27017,mongo-1.mongo:27000", port 27017 will be used for each host with 
#    no specified port.

ENV DBuser=hossam DBpass=ho121314  DBhosts=mongo-0.mongo.default.svc.cluster.local:27017 
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev
# Bundle app source
COPY index.js .
EXPOSE 3000
CMD [ "node", "index.js" ]


