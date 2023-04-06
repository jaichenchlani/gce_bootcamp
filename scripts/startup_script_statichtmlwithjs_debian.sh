#!/bin/bash
# Start up script for the Packer Built Debian Static HTML with JS Page Image

echo "***** Startup Script START *****"

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) Navigate to /var/www/html..."
cd /var/www/html

let "count++" # Increment the counter
echo "$count) Copy static files from GCS bucket..."
sudo gsutil cp gs://codegarage-templates-gcpuser10/static-html-with-js/* .

let "count++" # Increment the counter
echo "$count) Grant execute permissions for update_index_html.sh.."
sudo chmod u+x update_index_html.sh 

let "count++" # Increment the counter
echo "$count) Execute update_index_html.sh..."
sudo ./update_index_html.sh

echo "***** Startup Script END *****"