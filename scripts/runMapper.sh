#!/bin/bash

# File containing the list of classes
CLASSES_FILE="scripts/classes.txt"

# Check if the classes file exists
if [ ! -f "$CLASSES_FILE" ]; then
  echo "Classes file not found: $CLASSES_FILE"
  exit 1
fi

# Read the classes file and run the mapper script for each class
while IFS= read -r CLASS_NAME; do
  if [ -n "$CLASS_NAME" ]; then
    ./scripts/mapper.sh "$CLASS_NAME"
  fi
done < "$CLASSES_FILE"
