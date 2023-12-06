#!/bin/bash

# Install Apache2 for Debian

echo "START" | systemd-cat -t startup_script -p 4

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) Installing apache2..."  | systemd-cat -t startup_script -p 5
sudo apt -y install apache2
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

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

echo "END" | systemd-cat -t startup_script -p 4