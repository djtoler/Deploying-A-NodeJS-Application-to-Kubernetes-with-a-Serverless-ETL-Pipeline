#!/bin/bash

# Directory containing microservices
MICROSERVICES_DIR="./microservices"

# Starting port number
PORT=8001

# Navigate to the microservices directory
# cd "$MICROSERVICES_DIR"

# Loop through each directory in microservices
for dir in */ ; do
    # Remove the existing index.js file
    rm -f "$dir/index.js"

    # Create a new index.js file with the incremented port number
    cat > "$dir/index.js" <<EOF
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
const PORT = process.env.PORT || $PORT;
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

app.listen(PORT, () => console.log(\`MS-auth is running on port $PORT\`));
EOF

    ((PORT++))
done
