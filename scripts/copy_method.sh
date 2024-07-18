#!/bin/bash

# Script to copy the last method of PlatformInterface class from one Dart file to Api class in another Dart file

# Function to display usage information
usage() {
    echo "Usage: $0 <platform_interface_file> <api_file>"
    echo "  <platform_interface_file>: Path to the Dart file containing PlatformInterface class"
    echo "  <api_file>: Path to the Dart file containing Api class"
    exit 1
}

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

platform_interface_file="$1"
api_file="$2"

# Check if files exist
if [ ! -f "$platform_interface_file" ] || [ ! -f "$api_file" ]; then
    echo "Error: One or both input files do not exist."
    usage
fi

# Extract the last method from PlatformInterface class
last_method=$(awk '/class PlatformInterface/,/^}/' "$platform_interface_file" |
              grep -E '^\s*[A-Za-z].*\(.*\);$' |
              tail -n 1)

# Check if a method was found
if [ -z "$last_method" ]; then
    echo "Error: No method found in PlatformInterface class."
    exit 1
fi

# Prepare the method for insertion without the trailing semicolon
escaped_method=$(printf '%s\n' "$last_method" | sed 's/[&/\]/\\&/g' | sed 's/;$//')

# Extract return type (part before the first space character)
return_type=$(echo "$escaped_method" | awk '{print $1}')

# Extract method name (part after the first space and before the first '(')
method_name=$(echo "$escaped_method" | awk '{print $2}' | cut -d '(' -f 1)

# Extract method arguments (everything between '(' and ')')
method_arguments=$(echo "$escaped_method" | sed -n 's/.*(\(.*\)).*/\1/p')

# Remove argument types, keeping only argument names, and handle trailing comma
method_arguments_names=$(echo "$method_arguments" | sed -E 's/([A-Za-z0-9_]+ )([A-Za-z0-9_]+)/\2/g' | sed 's/, ,/,/g' | sed 's/,$//')

# Insert the last method at the end of Api class
sed -i '' "/class Api/,/^}/ {/^}/i\\
Future<$return_type> $method_name($method_arguments) { return $method_name($method_arguments_names); }
}" "$api_file"

# Format the api.dart file
dart format "$api_file"

echo "Last method from PlatformInterface has been copied to the end of Api class in $api_file and the file has been formatted."
echo "Method name: $method_name"
echo "Return type: $return_type"
echo "Method arguments: $method_arguments"
