FROM node:10 as Base

RUN apt-get update
RUN apt-get install git python make gcc g++ bash

WORKDIR /app
COPY . .

RUN npm install; \
    npm run build; 

EXPOSE 3010

CMD [ "npm", "run", "start" ]