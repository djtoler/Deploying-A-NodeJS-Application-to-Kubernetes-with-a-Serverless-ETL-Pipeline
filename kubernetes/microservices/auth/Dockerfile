1
FROM node:14

WORKDIR /app

RUN git clone -b ms-auth https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8003

CMD ["npm", "start"]
