#!/bin/bash
# This script is configured to be launched from root
# used by pre-commit hook

# Constant for the path to the gradlew script
PROJECT_PATH="example/android"
GRADLEW_PATH="$PROJECT_PATH/gradlew"

# Check if the gradlew script exists at the specified path
if [ ! -f "$GRADLEW_PATH" ]; then
  echo "Error: $GRADLEW_PATH not found!"
  exit 1
fi

# Run the gradle command with the specified task(s)
cd "$PROJECT_PATH" || exit
./gradlew :flutter_drivekit_trip_analysis_android:formatKotlin
./gradlew :flutter_drivekit_trip_simulator_android:formatKotlin
./gradlew :flutter_drivekit_driver_data_android:formatKotlin
./gradlew :flutter_drivekit_core_android:formatKotlin

# Check if the gradle command was successful
if [ $? -eq 0 ]; then
  echo "Gradle command executed successfully."
else
  echo "Gradle command failed."
  exit 1
fi
