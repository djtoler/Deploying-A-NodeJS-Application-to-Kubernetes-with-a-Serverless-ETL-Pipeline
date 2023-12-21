FROM node:14

WORKDIR /app

RUN git clone -b ms-signup https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8015

CMD ["npm", "start"]
