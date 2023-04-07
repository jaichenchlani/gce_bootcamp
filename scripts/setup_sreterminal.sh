#!/bin/bash

# Execute this after you SSH into sreterminal.

# Source Bash Config and Utilities
source /home/repos/utilities/load_bash_config_and_utilities.sh

echo "***** sreterminal jumpbox setup START *****"

# Initialize the counter
count=0

let "count++" # Navigate to $HOME
echo "$count) Navigate to $HOME..."
cd $HOME

let "count++" # Check gcloud version
echo "$count) Check gcloud version..."
gcloud --version

let "count++" # Check kubectl version
echo "$count) Check kubectl version..."
kubectl version

let "count++" # Check terraform version
echo "$count) Check terraform version..."
terraform --version

let "count++" # Check packer version
echo "$count) Check packer version..."
packer --version

let "count++" # Validate the cloned repos
echo "$count) Validate the cloned repos..."
ls -lrt /home/repos

let "count++" # Look at the aliases..
echo "$count) Look at the aliases BEFORE setting them up..."
alias

let "count++" # Update bash profile to add aliases
echo "$count) Update bash profile to add aliases..."
cat /home/repos/utilities/aliases.md >> .bashrc

echo "run 'source .bashrc' manually to have the aliases take effect."

echo "***** sreterminal jumpbox setup END *****"

