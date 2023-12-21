FROM node:14

WORKDIR /app

RUN git clone -b ms-checkAttempt https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8004

CMD ["npm", "start"]