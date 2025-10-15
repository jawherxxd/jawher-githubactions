#!/bin/bash
output=$(node -e "const greet = require('./app').greet; console.log(greet('Test'))")
if [ "$output" = "Hello, Test!" ]; then
  echo "Test passed!"
  exit 0
else
  echo "Test failed: got '$output'"
  exit 1
fi