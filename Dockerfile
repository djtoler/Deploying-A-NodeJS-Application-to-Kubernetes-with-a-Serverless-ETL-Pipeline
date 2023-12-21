FROM node:14

WORKDIR /app

RUN git clone -b ms-getQuiz https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8010

CMD ["npm", "start"]
