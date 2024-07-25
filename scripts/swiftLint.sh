#!/bin/bash
# This script is configured to be launched from root
# used by pre-commit hook

PROJECT_NAMES=("drivekit_core" "drivekit_trip_analysis" "drivekit_trip_simulator")

for PROJECT_NAME in "${PROJECT_NAMES[@]}"; do
  PROJECT_ROOT="packages/${PROJECT_NAME}/flutter_${PROJECT_NAME}_ios/ios"
  PODS_ROOT="packages/${PROJECT_NAME}/flutter_${PROJECT_NAME}/example/ios/Pods"

  "$PODS_ROOT/SwiftLint/swiftlint" "$PROJECT_ROOT" --fix --config "$PROJECT_ROOT/.swiftlint.yml"
done
