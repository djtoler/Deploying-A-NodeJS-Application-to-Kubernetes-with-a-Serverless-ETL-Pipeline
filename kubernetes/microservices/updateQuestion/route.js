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
router.post("/updateQuestion", async (req, res) => {
  const { content, optionA, optionB, optionC, optionD, answer, _id } = req.body;

  Question.updateOne(
    { _id: _id },
    {
      content: content,
      answer: answer,
      optionA: optionA,
      optionB: optionB,
      optionC: optionC,
      optionD: optionD,
    },
    (err, docs) => {
      if (err) {
        console.log(err);
      } else {
        res.send("Data Updated Successfully");
      }
    }
  );
});
