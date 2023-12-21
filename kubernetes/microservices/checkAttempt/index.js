1
const express = require("express");
const mongo_connection = require("./database/db.js");
const dotenv = require("dotenv");
const cors = require("cors");
const Routes = require("./routes/route.js");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const session = require("express-session");
const MongoStore = require("connect-mongo");
const path = require("path");
const app = express();
const PORT = process.env.PORT || 8004;
dotenv.config();

const username = "kurafinalpj";
const password = "kurafinalpj";
const URL = "mongodb+srv://kurafinalpj:kurafinalpj@cluster0.mjwldbe.mongodb.net/?retryWrites=true&w=majority";
mongo_connection.Connection(username, password);

app.use(bodyParser.json({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());

app.use(
  session({
    secret: "asdfefna",
    saveUninitialized: false,
    resave: false,
    store: MongoStore.create({
      mongoUrl: URL,
    }),
    cookie: {
      expires: 60 * 60 * 24 * 1000 * 30,
    },
  })
);

app.use(express.json());

app.use(
  cors({
    origin: true,
    method: ["GET", "POST"],
    credentials: true,
  })
); 

app.use(express.static(path.join(__dirname + "/public")));

app.use("/", Routes);

app.listen(PORT, () => console.log(`MS-auth is running on port 8004`));
