#!/bin/bash

# Comprehensive Startup Script for Grafana DEBIAN used in Stage 3/4 of the demo
# This includes both installation and Startup steps.
# THIS SHOULD NOT BE USED WHEN CREATING INFRA USING TERRAFORM
# THIS IS SUITED FOR STAGE 3/4 DEMO ONLY
# https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/


echo "***** Install Grafana Script START *****"

# Initialize the counter
count=0

let "count++" # Increment the counter
echo "$count) Install the latest Grafana release"
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key

let "count++" # Increment the counter
echo "$count) Add this repository for stable releases:"
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

let "count++" # Increment the counter
echo "$count) Update apt-get..."
sudo apt-get update

let "count++" # Increment the counter
echo "$count) Install the latest Grafana OSS release..."
sudo apt-get -y install grafana

let "count++" # Increment the counter
echo "$count) Configure the Grafana server to start at boot..."
sudo systemctl enable grafana-server.service

echo "$count) Installing fluentd..."
echo "Instructions from https://cloud.google.com/logging/docs/agent/logging/installation"
sudo curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install

let "count++" # Increment the counter
echo "$count) Enable structured logging..."
sudo apt-get remove -y google-fluentd-catch-all-config
sudo apt-get install -y google-fluentd-catch-all-config-structured
sudo service google-fluentd restart

let "count++" # Increment the counter
echo "$count) Start grafana-server..."
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server

echo "***** Install Grafana Script END *****"