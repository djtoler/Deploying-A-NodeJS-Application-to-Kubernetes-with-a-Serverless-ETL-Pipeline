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
router.post("/createQuiz", async (req, res) => {
  const { title, questions } = req.body;

  // Creating object of the user
  const newQuiz = new Quiz({
    title: title,
    questions: questions,
    userId: req.session.user,
  });

  // Create new Quiz
  await newQuiz.save();
  res.send("Quiz Created Successfully");
});
