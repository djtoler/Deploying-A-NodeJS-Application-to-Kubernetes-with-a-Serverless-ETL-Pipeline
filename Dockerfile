FROM node:14

WORKDIR /app

RUN git clone -b ms-route https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8014

CMD ["npm", "start"]
