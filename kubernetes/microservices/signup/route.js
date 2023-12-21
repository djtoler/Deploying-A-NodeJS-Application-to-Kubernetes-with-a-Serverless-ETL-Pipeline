1
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
router.post("/signup", async (request, response) => {
  const details = request.body;

  // Creating object of the user
  const newUser = new User(details);

  try {
    User.countDocuments(
      { username: details.username },
      async function (err, count) {
        // Check Username exists or not
        if (count > 0) {
          response.send(false);
        } else {
          // Create new User
          await newUser.save();
          response.send(true);
        }
      }
    );
  } catch (error) {
    response.status(409).json({ message: error.message });
  }
});
