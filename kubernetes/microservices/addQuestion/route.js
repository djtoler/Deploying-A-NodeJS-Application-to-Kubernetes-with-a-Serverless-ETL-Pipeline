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
router.post("/addQuestion", async (req, res) => {
  const { content, optionA, optionB, optionC, optionD, answer } = req.body;

  // Creating object of the user
  const newQuestion = new Question({
    content: content,
    answer: answer,
    optionA: optionA,
    optionB: optionB,
    optionC: optionC,
    optionD: optionD,
    userId: req.session.user,
  });

  // Create new User
  await newQuestion.save();
  res.send("Data Inserted Successfully");
});
