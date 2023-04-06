#!/bin/bash
# Comprehensive Startup Script for CENTOS used in Stage 3/4 of the demo
# This includes both installation and Startup steps.
# THIS SHOULD NOT BE USED WHEN CREATING INFRA USING TERRAFORM
# THIS IS SUITED FOR STAGE 3/4 DEMO ONLY

echo "***** Startup Script START *****"

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) sleeping for 30 seconds for the VM to boot up completely..."
sleep 30

let "count++" # Increment the counter
echo "$count) Installing httpd..."
sudo yum -y install httpd

echo "$count) Installing fluentd..."
echo "Instructions from https://cloud.google.com/logging/docs/agent/logging/installation"
sudo curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install

let "count++" # Increment the counter
echo "$count) Enable structured logging..."
sudo yum remove -y google-fluentd-catch-all-config
sudo yum install -y google-fluentd-catch-all-config-structured
sudo service google-fluentd restart

let "count++" # Increment the counter
echo "$count) Navigate to /var/www/html..."
cd /var/www/html

let "count++" # Increment the counter
echo "$count) Copy static files from GCS bucket..."
sudo gsutil cp gs://codegarage-templates-gcpuser10/static-html/* .

let "count++" # Increment the counter
echo "$count) Grant execute permissions for update_index_html.sh.."
sudo chmod u+x update_index_html.sh 

let "count++" # Increment the counter
echo "$count) Execute update_index_html.sh..."
sudo ./update_index_html.sh

let "count++" # Increment the counter
echo "Start httpd service..."
sudo systemctl start httpd

echo "***** Startup Script END *****"