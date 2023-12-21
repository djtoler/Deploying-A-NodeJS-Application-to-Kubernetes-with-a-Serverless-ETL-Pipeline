FROM node:14

WORKDIR /app

RUN git clone -b ms-getQuestions https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8009

CMD ["npm", "start"]
