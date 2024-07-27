#!/bin/bash

# set the file and spaces variables
file="../../Dockerfile"
num_spaces="6"

# Generate the spaces string
spaces=$(printf "%*s" "$num_spaces" "")

# add space on top
echo "" >Dockerfile

# Read the file line by line and add spaces
while IFS= read -r line; do
  echo "${spaces}${line}" >>Dockerfile
done < "$file"
