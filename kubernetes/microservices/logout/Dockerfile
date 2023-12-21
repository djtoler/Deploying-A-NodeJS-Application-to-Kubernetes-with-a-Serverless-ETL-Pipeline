1
FROM node:14

WORKDIR /app

RUN git clone -b ms-logout https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8013

CMD ["npm", "start"]
