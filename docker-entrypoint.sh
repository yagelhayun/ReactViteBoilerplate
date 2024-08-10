#!/bin/sh

prefix=VITE_

# Look for any .js file
for file in $(find . -type f -name "*.js"); do
    # Loop through environment variables that start with $prefix
    for var in $(env | grep $prefix); do
        # Extract the key and value of the variable
        key=$(echo $var | cut -d '=' -f 1)
        value=$(echo $var | cut -d '=' -f 2)
        # Replace occurrences of $key (with an escaped $) with $value in the file
        sed -e "s/\$$key/$value/g" -i $file
    done
done

# Start the nginx web server
nginx -g 'daemon off;'
