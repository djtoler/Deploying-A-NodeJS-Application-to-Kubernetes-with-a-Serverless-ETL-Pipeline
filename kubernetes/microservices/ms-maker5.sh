#!/bin/bash

# The content to add at the beginning of each .js file
read -r -d '' content_to_add << 'EOF'
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
EOF

# Loop over all .js files in the current directory
for file in *.js; do
  # Skip if the file is not a regular file
  [ -f "$file" ] || continue

  # Create a temporary file
  tmp_file=$(mktemp)

  # Write the content to add and the original file content to the temporary file
  {
    echo "$content_to_add"
    cat "$file"
  } > "$tmp_file"

  # Move the temporary file content back to the original file
  mv "$tmp_file" "$file"

  # Create a directory named after the file (without the .js extension)
  dir_name="${file%.js}"
  mkdir -p "$dir_name"

  # Move the file into the directory, replacing it if it already exists
  mv -f "$file" "$dir_name/"
done
