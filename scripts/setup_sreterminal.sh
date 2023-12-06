#!/bin/bash

# The startup script performs the following functions
# A. Install SRE Terminal Tools
# B. Clone the following respos in /home/repos folder
# https://github.com/jaichenchlani/utilities.git
# https://github.com/jaichenchlani/terraform_modules.git
# https://github.com/jaichenchlani/gce_bootcamp.git


echo "START" | systemd-cat -t startup_script -p 4

# Initialize the counter
count=0

let "count++" # Install wget
echo "$count) Install wget..."  | systemd-cat -t startup_script -p 5
sudo dnf install wget -y
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install GIT
echo "$count) Install git..." | systemd-cat -t startup_script -p 5
sudo dnf install git -y
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install kubectl
echo "$count) Install kubectl..." | systemd-cat -t startup_script -p 5
sudo dnf install kubectl -y
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install gke-gcloud-auth-plugin - needed for kubectl commands to work
echo "$count) Install gke-gcloud-auth-plugin..." | systemd-cat -t startup_script -p 5
sudo dnf install -y google-cloud-sdk-gke-gcloud-auth-plugin
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install yum-utils
echo "$count) Install yum-utils..." | systemd-cat -t startup_script -p 5
sudo dnf install -y yum-utils
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Add hashicorp repo
echo "$count) Add hashicorp repo..." | systemd-cat -t startup_script -p 5
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install terraform
echo "$count) Install terraform..." | systemd-cat -t startup_script -p 5
sudo dnf -y install terraform
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install packer
echo "$count) Install packer..." | systemd-cat -t startup_script -p 5
sudo dnf -y install packer
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Install docker
echo "$count) Install docker..." | systemd-cat -t startup_script -p 5
sudo dnf -y install docker
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Navigate to /home
echo "$count) Navigate to /home and create repos folder..." | systemd-cat -t startup_script -p 5
# cd $HOME
cd home
mkdir repos
cd repos
pwd

let "count++" # Clone utilities repo
echo "$count) Cloning utilities repo..." | systemd-cat -t startup_script -p 5
git clone https://github.com/jaichenchlani/utilities.git
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Clone Terraform Modules
echo "$count) Cloning Terraform Modules..." | systemd-cat -t startup_script -p 5
git clone https://github.com/jaichenchlani/terraform_modules.git
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Clone GCE Bootcamp Udemy Course Demo code
# https://www.udemy.com/course/google-cloud-gce-reliability-engineering-using-terraform
echo "$count) Clone GCE Bootcamp Udemy Course Demo code..." | systemd-cat -t startup_script -p 5
git clone https://github.com/jaichenchlani/gce_bootcamp.git
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Validate the cloned repos
echo "$count) Validate the cloned repos..." | systemd-cat -t startup_script -p 5
ls -lrt /home/repos
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Look at the aliases..
echo "$count) Look at the aliases BEFORE setting them up..." | systemd-cat -t startup_script -p 5
alias
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

let "count++" # Update bash profile to add aliases
echo "$count) Update bash profile to add aliases..." | systemd-cat -t startup_script -p 5
cat /home/repos/utilities/aliases.md >> .bashrc
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

echo "run 'source .bashrc' manually to have the aliases take effect." | systemd-cat -t startup_script -p 4

echo "END" | systemd-cat -t startup_script -p 4