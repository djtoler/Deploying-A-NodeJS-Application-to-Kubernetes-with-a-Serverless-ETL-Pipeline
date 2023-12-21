const express = require("../../../../express");
const mongoose = require("../../../../mongoose");
const MongoStore = require("../../../../connect-mongo");
const dotenv = require("../../../../dotenv");
const session = require("../../../../express-session");
const redis = require('../../../../redis');
const { User, Question, Quiz, Attempt } = require('../../../../database/models');

const router = express.Router();

const app = express();
dotenv.config();

const redisClient = redis.createClient({
  host: 'redis-cache-service', // Kubernetes Service name for Redis
  port: 6379 // Standard Redis port
});

const username = "kurafinalpj";
const password = "kurafinalpj";

const URL = `mongodb+srv://kurafinalpj:kurafinalpj@cluster0.mjwldbe.mongodb.net/?retryWrites=true&w=majority`;
router.post("/login", async (request, response) => {
  const { username, password } = request.body;

  try {
    User.findOne({ username: username, password: password }, (err, docs) => {
      if (docs) {
        request.session.user = docs._id;
        request.session.isAuth = true;
        console.log(request.session);
        response.send(true);
      } else {
        response.send(false);
      }
    }).lean();
  } catch (error) {
    console.log(error);
    response.status(409).json({ message: error.message });
  }
});
