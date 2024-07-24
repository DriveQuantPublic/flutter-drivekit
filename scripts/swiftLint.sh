#!/bin/bash

PROJECT_NAMES=("drivekit_core")

for PROJECT_NAME in "${PROJECT_NAMES[@]}"; do
  PROJECT_ROOT="packages/${PROJECT_NAME}/flutter_${PROJECT_NAME}_ios/ios"
  PODS_ROOT="packages/${PROJECT_NAME}/flutter_${PROJECT_NAME}/example/ios/Pods"

  "$PODS_ROOT/SwiftLint/swiftlint" "$PROJECT_ROOT" --fix --config "$PROJECT_ROOT/.swiftlint.yml"
done
