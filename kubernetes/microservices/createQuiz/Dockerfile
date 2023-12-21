1
FROM node:14

WORKDIR /app

RUN git clone -b ms-createQuiz https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8005

CMD ["npm", "start"]
