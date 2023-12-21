FROM node:14

WORKDIR /app

RUN git clone -b ms-getAttemptQuizes https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8006

CMD ["npm", "start"]
