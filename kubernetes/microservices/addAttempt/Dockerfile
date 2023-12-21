1
FROM node:14

WORKDIR /app

RUN git clone -b ms-addAttempt https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8001

CMD ["npm", "start"]
