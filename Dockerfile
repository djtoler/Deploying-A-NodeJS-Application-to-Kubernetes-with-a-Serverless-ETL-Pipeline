FROM node:14

WORKDIR /app

RUN git clone -b ms-getProfile https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8008

CMD ["npm", "start"]
