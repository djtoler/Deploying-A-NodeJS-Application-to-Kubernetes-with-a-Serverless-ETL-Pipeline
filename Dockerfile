FROM node:14

WORKDIR /app

RUN git clone -b ms-addQuestion https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8002

CMD ["npm", "start"]
