#!/bin/bash

# Install Apache2 for Debian

echo "***** Startup Script START *****"

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) Installing apache2..."
sudo apt -y install apache2

echo "$count) Installing fluentd..."
echo "Instructions from https://cloud.google.com/logging/docs/agent/logging/installation"
sudo curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install

let "count++" # Increment the counter
echo "$count) Enable structured logging..."
sudo apt-get remove -y google-fluentd-catch-all-config
sudo apt-get install -y google-fluentd-catch-all-config-structured
sudo service google-fluentd restart

echo "***** Startup Script END *****"