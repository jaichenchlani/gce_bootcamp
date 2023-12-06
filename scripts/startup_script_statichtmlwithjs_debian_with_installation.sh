#!/bin/bash

# Comprehensive Startup Script for DEBIAN used in Stage 3/4 of the demo
# This includes both installation and Startup steps.
# THIS SHOULD NOT BE USED WHEN CREATING INFRA USING TERRAFORM
# THIS IS SUITED FOR STAGE 3/4 DEMO ONLY

echo "START" | systemd-cat -t startup_script -p 4

### Webserver Configuration Files Location
config_files_location="gs://codegarage-001-app-config-files-001/webserver-debian"

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) Installing fluentd..."  | systemd-cat -t startup_script -p 5
echo "Instructions from https://cloud.google.com/logging/docs/agent/logging/installation"
sudo curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Enable structured logging..."  | systemd-cat -t startup_script -p 5
sudo apt-get remove -y google-fluentd-catch-all-config
sudo apt-get install -y google-fluentd-catch-all-config-structured
sudo service google-fluentd restart
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Installing apache2..." | systemd-cat -t startup_script -p 5
sudo apt-get -y install apache2
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Navigate to /var/www/html..."  | systemd-cat -t startup_script -p 5
cd /var/www/html
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Copy static files from GCS bucket..."  | systemd-cat -t startup_script -p 5
sudo gsutil cp "$config_files_location/*" .
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Grant execute permissions for update_index_html.sh.."  | systemd-cat -t startup_script -p 5
sudo chmod u+x update_index_html.sh 
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Execute update_index_html.sh..."  | systemd-cat -t startup_script -p 5
sudo ./update_index_html.sh
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

echo "END" | systemd-cat -t startup_script -p 4