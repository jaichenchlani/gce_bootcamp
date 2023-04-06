#!/bin/bash

# Install Apache HTTP Server for Centos

echo "***** Startup Script START *****"

# Initialize the counter
count=0

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

echo "***** Startup Scriipt END *****"