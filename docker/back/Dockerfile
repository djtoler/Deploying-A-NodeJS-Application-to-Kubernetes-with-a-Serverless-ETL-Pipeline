FROM node:14

WORKDIR /app

RUN git clone -b blue-useast1 https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8000

CMD ["npm", "start"]
