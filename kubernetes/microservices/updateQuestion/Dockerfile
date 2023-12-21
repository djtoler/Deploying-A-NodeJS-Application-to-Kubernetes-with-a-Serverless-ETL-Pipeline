1
FROM node:14

WORKDIR /app

RUN git clone -b ms-updateQuestion https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE 8016

CMD ["npm", "start"]
