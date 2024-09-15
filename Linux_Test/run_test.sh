#!/bin/bash

# Directory containing your text files
DIR="questions"

# Minimum and maximum sleep duration in seconds
MIN_SLEEP=2
MAX_SLEEP=10

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "Directory $DIR does not exist."
  exit 1
fi

# Get a list of text files in the directory
FILES=("$DIR"/*.txt)

# Check if there are any text files in the directory
if [ ${#FILES[@]} -eq 0 ]; then
  echo "No text files found in the directory $DIR."
  exit 1
fi

# Function to display a random file's content
display_random_file() {
  local file="${FILES[RANDOM % ${#FILES[@]}]}"
  clear
  echo "Displaying content of: $file"
  cat "$file"
  echo
}

# Loop to keep displaying random files
while true; do
  display_random_file
  SLEEP_DURATION=10
  echo "Next question in $SLEEP_DURATION seconds..."
  sleep "$SLEEP_DURATION"  # Sleep for a random duration before displaying the next file
done
