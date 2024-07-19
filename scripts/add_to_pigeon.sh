#!/bin/bash

# Script to copy the last method of PlatformInterface class from one Dart file to pigeon class in another Dart file

# Function to display usage information
usage() {
    echo "Usage: $0 <platform_interface_file> <pigeon_file>"
    echo "  <platform_interface_file>: Path to the Dart file containing PlatformInterface class"
    echo "  <pigeon_file>: Path to the Dart file containing DefaultImplementation class"
    echo "  <platform_interface_class_name>: name of the class containing the platform interface"
    echo "  <pigeon_class_name>: name of the class containing the DefaultImplementation"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    usage
fi

platform_interface_file="$1"
pigeon_file="$2"

platform_interface_class_name="$3"
pigeon_class_name="$4"

# Check if the files exist
if [ ! -f "$platform_interface_file" ] || [ ! -f "$pigeon_file" ]; then
    echo "Error: One or both input files do not exist."
    usage
fi

# Extract the entire PlatformInterface class content
platform_interface_content=$(awk "/class $platform_interface_class_name/,/^}/" "$platform_interface_file")

# Extract all method declarations, including multi-line methods
methods=$(echo "$platform_interface_content" | awk '
  /^[ \t]*(Future<[A-Za-z0-9_<> ,]+>|[A-Za-z0-9_]+)[ \t]+[A-Za-z0-9_]+\(/ {if (method != "") print method; method=$0; next}
  /\);[ \t]*$/ {print method " " $0; method=""}
  method {method=method " " $0}
  END {if (method != "") print method}
')

# Get the last method
last_method=$(echo "$methods" | tail -n 1)

# Check if a method was found
if [ -z "$last_method" ]; then
    echo "Error: No method found in $platform_interface_class_name class."
    exit 1
fi

# Prepare the method for insertion without the trailing semicolon and any leading/trailing spaces
escaped_method=$(echo "$last_method" | sed 's/[&/\]/\\&/g' | sed 's/;$//' | sed 's/^[ \t]*//' | sed 's/[ \t]*$//' | sed 's/}//g')

# Extract return type and method signature
return_type=$(echo "$escaped_method" | awk '{print $1}')
method_signature=$(echo "$escaped_method" | cut -d' ' -f2-)

# Check if the return type is Future<Type>
if [[ "$return_type" == Future* ]]; then
    inner_type=$(echo "$return_type" | sed -E 's/Future<(.+)>/\1/')
else
    inner_type="$return_type"
fi

# Prepare the final method for insertion
final_method="$inner_type $method_signature"

# Insert the last method at the end of DefaultImplementation class
sed -i '' "/class $pigeon_class_name/,/^}/ {/^}/i\\
$final_method
}" "$pigeon_file"

# Format the DefaultImplementation.dart file
dart format "$pigeon_file"

echo "Last method from $platform_interface_class_name has been copied to the end of $pigeon_class_name class in $pigeon_file and the file has been formatted."
