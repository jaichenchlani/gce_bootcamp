#!/bin/bash

# Install Grafana for Debian
# https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/


echo "START" | systemd-cat -t startup_script -p 4

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) Install the latest Grafana release"  | systemd-cat -t startup_script -p 5
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Add this repository for stable releases:"  | systemd-cat -t startup_script -p 5
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Update apt-get..."  | systemd-cat -t startup_script -p 5
sudo apt-get update
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Install the latest Grafana OSS release..."  | systemd-cat -t startup_script -p 5
sudo apt-get -y install grafana
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Increment the counter
echo "$count) Configure the Grafana server to start at boot..."  | systemd-cat -t startup_script -p 5
sudo systemctl enable grafana-server.service
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

echo "$count) Installing fluentd..."
echo "Instructions from https://cloud.google.com/logging/docs/agent/logging/installation"  | systemd-cat -t startup_script -p 5
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