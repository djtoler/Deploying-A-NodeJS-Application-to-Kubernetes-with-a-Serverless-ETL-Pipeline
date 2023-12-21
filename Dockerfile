FROM node:14

WORKDIR /app

RUN git clone -b ms-getResults https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8011

CMD ["npm", "start"]
