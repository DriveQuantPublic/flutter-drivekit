#!/bin/bash

# Script to copy the last method of PlatformInterface class from one Dart file to Api class in another Dart file

# Function to display usage information
usage() {
    echo "Usage: $0 <platform_interface_file> <api_file>"
    echo "  <platform_interface_file>: Path to the Dart file containing PlatformInterface class"
    echo "  <api_file>: Path to the Dart file containing Api class"
    echo "  <platform_interface_class_name>: name of the class containing the platform interface"
    echo "  <api_class_name>: name of the class containing the api"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    usage
fi

platform_interface_file="$1"
api_file="$2"

platform_interface_class_name="$3"
api_class_name="$4"

# Check if the files exist
if [ ! -f "$platform_interface_file" ] || [ ! -f "$api_file" ]; then
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
escaped_method=$(echo "$last_method" | sed 's/[&/\]/\\&/g' | sed 's/;$//' | sed 's/^[ \t]*//' | sed 's/[ \t]*$//')

# Extract return type (part before the first space character)
return_type=$(echo "$escaped_method" | awk '{print $1}')

# Extract method name (part after the first space and before the first '(')
method_name=$(echo "$escaped_method" | awk '{print $2}' | cut -d '(' -f 1)

# Extract method arguments (everything between '(' and ')')
method_arguments=$(echo "$escaped_method" | sed -n 's/.*(\(.*\)).*/\1/p')

# Extract named arguments (everything between '{' and '}')
named_arguments=$(echo "$method_arguments" | grep -o '{.*}' | tr -d '{}' | sed 's/,$//')

# Extract positional arguments (everything not between '{' and '}')
positional_arguments=$(echo "$method_arguments" | sed 's/{.*}//')

# Create a new variable positional_arguments_names
positional_arguments_names=$(echo "$positional_arguments" | sed -E 's/([A-Za-z0-9_]+ )([A-Za-z0-9_]+)/\2/g' | tr '\n' ',' | sed 's/, ,/,/g' | sed 's/,$//')

# Create a String of named arguments for the method call in the format: arg_name:arg_name, ...
named_arguments_call=""
IFS=',' read -ra named_args_array <<< "$named_arguments"
for arg in "${named_args_array[@]}"; do
    arg=$(echo "$arg" | sed 's/^[ \t]*//;s/[ \t]*$//')
    if [[ "$arg" == "required "* ]]; then
        arg_name=$(echo "$arg" | awk '{print $3}')
    else
        arg_name=$(echo "$arg" | awk '{print $2}')
    fi
    # If there is a trailing comma, the last entry is empty, so we 
    # check if the added arg is a valid argument name
    if [[ "$arg_name" =~ ^[A-Za-z0-9_]+$ ]]; then
        named_arguments_call+="$arg_name:$arg_name, "
    fi
done

# Remove trailing comma and space
named_arguments_call=$(echo "$named_arguments_call" | sed 's/, $//')

# Create a variable method_arguments_call
method_arguments_call="$positional_arguments_names"
if [ -n "$named_arguments_call" ]; then
    if [ -n "$positional_arguments_names" ]; then
        method_arguments_call+=", $named_arguments_call"
    else
        method_arguments_call+="$named_arguments_call"
    fi
fi

# Determine if return_type is already Future
if [[ "$return_type" == Future* ]]; then
    final_return_type="$return_type"
else
    final_return_type="Future<$return_type>"
fi

# Insert the last method at the end of Api class
sed -i '' "/class $api_class_name/,/^}/ {/^}/i\\
$final_return_type $method_name($method_arguments) => _platform.$method_name($method_arguments_call,); 
}" "$api_file"

# Format the api.dart file
dart format "$api_file"

echo "Last method from $platform_interface_class_name has been copied to the end of $api_class_name class in $api_file and the file has been formatted."
