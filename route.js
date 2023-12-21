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
router.post("/addAttempt", async (req, res) => {
  const result = req.body;

  // Creating object of the attempt
  const newAttempt = new Attempt({
    userId: req.session.user,
    correct: result.correct,
    incorrect: result.incorrect,
    time: result.time,
    quizId: result.quizId,
  });

  // Create new Attempt
  await newAttempt.save();
  res.send("Attempt Added successfully");
});
