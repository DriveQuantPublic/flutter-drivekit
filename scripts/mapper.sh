#!/bin/bash
# This is an experimental script to generate a mapper function for a Pigeon class.

# Check if class name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <ClassName>"
  exit 1
fi

CLASS_NAME=$1

# Define file paths
MESSAGES_FILE="packages/drivekit_trip_analysis/flutter_drivekit_trip_analysis_android/pigeon/messages.dart"
MODEL_FILE="packages/drivekit_trip_analysis/flutter_drivekit_trip_analysis_android/pigeon/model.dart"
MODEL_ADAPTER_FILE="packages/drivekit_trip_analysis/flutter_drivekit_trip_analysis_android/lib/src/modelAdapter.dart"

# Extract class definition from messages file
CLASS_DEFINITION=$(sed -n "/class $CLASS_NAME/,/^}/p" $MESSAGES_FILE)

# Check if class definition is found
if [ -z "$CLASS_DEFINITION" ]; then
  echo "Class $CLASS_NAME not found in $MESSAGES_FILE"
  exit 1
fi

# Generate model class name by removing 'Pigeon' prefix
MODEL_CLASS_NAME=$(echo "$CLASS_NAME" | sed 's/^Pigeon//')

# Generate mapper function
MAPPER_FUNCTION=$(cat <<EOF

/// Adapts the [$CLASS_NAME] class to the corresponding class in the model.
extension ${CLASS_NAME}Adapter on $CLASS_NAME {
  /// Converts a [$CLASS_NAME] to a corresponding model class.
  $MODEL_CLASS_NAME toModelImplementation() {
    return $MODEL_CLASS_NAME(
$(echo "$CLASS_DEFINITION" | grep -o 'final [^ ]* \([^ ]*\)' | awk '{print $2, $3}' | while read -r type field; do
  if [[ "$type" == "bool" || "$type" == "String" || "$type" == "int" || "$type" == "double" || "$type" == "bool?" || "$type" == "String?" || "$type" == "int?" || "$type" == "double?" ]]; then
    echo "      ${field//;}: ${field//;},"
  else
    echo "      ${field//;}: ${field//;}.toModelImplementation(),"
  fi
done)
    );
  }
}
EOF
)

# Append mapper function to modelAdapter file
echo "$MAPPER_FUNCTION" >> $MODEL_ADAPTER_FILE

echo "Mapper function for $CLASS_NAME has been added to $MODEL_ADAPTER_FILE"
