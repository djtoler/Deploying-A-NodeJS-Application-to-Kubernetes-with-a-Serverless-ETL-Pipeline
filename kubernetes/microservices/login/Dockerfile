1
FROM node:14

WORKDIR /app

RUN git clone -b ms-login https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8012

CMD ["npm", "start"]
