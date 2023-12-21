FROM node:14

WORKDIR /app

RUN git clone -b ms-getPlayQuiz https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8007

CMD ["npm", "start"]
