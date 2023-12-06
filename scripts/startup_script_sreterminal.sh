#!/bin/bash

# THIS IS OBSOLETE

# The startup script performs the following functions
# A. Install SRE Terminal Tools
# git, kubectl, yum-utils, terraform, packer
# B. Clone the following respos in /home/repos folder
# https://github.com/jaichenchlani/utilities.git
# https://github.com/jaichenchlani/terraform_modules.git
# https://github.com/jaichenchlani/gce_bootcamp.git

echo "***** Startup Script START *****"

# Initialize the counter
count=0

let "count++" # Install GIT
echo "$count) Install git..."
sudo yum install git -y

let "count++" # Install kubectl
echo "$count) Install kubectl..."
sudo yum install kubectl -y

let "count++" # Install yum-utils
echo "$count) Install yum-utils..."
sudo yum install -y yum-utils

let "count++" # Add hashicorp repo
echo "$count) Install yum-utils..."
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

let "count++" # Install terraform
echo "$count) Install terraform..."
sudo yum -y install terraform

let "count++" # Install packer
echo "$count) Install packer..."
sudo yum -y install packer

let "count++" # Navigate to /home
echo "$count) Navigate to /home and create repos folder..."
# cd $HOME
cd home
mkdir repos
cd repos
pwd

let "count++" # Clone utilities repo
echo "$count) Cloning utilities repo..."
git clone https://github.com/jaichenchlani/utilities.git

let "count++" # Clone Terraform Modules
echo "$count) Cloning Terraform Modules..."
git clone https://github.com/jaichenchlani/terraform_modules.git

let "count++" # Clone GCE Bootcamp Udemy Course Demo code
# https://www.udemy.com/course/google-cloud-gce-reliability-engineering-using-terraform
echo "$count) Clone GCE Bootcamp Udemy Course Demo code..."
git clone https://github.com/jaichenchlani/gce_bootcamp.git

echo "***** Startup Script END *****"