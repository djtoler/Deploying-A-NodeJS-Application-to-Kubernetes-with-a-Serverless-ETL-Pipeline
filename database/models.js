const mongoose = require('mongoose');

// User model
const userSchema = mongoose.Schema({
  username: String,
  password: String,
  fullName: String,
});
const User = mongoose.model("users", userSchema);

// Question model
const questionSchema = mongoose.Schema({
  content: String,
  optionA: String,
  optionB: String,
  optionC: String,
  optionD: String,
  answer: String,
  userId: String,
});
const Question = mongoose.model("questions", questionSchema);

// Quiz model
const quizSchema = mongoose.Schema({
  title: String,
  questions: Array,
  userId: String,
});
const Quiz = mongoose.model("quizes", quizSchema);

// Attempt model
const attemptSchema = mongoose.Schema({
  quizId: { type: mongoose.Schema.Types.ObjectId, ref: "quizes" },
  correct: Number,
  incorrect: Number,
  time: Number,
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "users" },
});
const Attempt = mongoose.model("attempts", attemptSchema);

module.exports = {
  User,
  Question,
  Quiz,
  Attempt
};