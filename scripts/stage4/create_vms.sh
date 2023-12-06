#!/bin/bash

# Stage 4 | Complete automation using bash scripts
Create the VMs 

# Source Bash Config and Utilities
source /home/repos/utilities/load_bash_config_and_utilities.sh

echo "***** Create VMs START *****"

# Initialize the counter
count=0

let "count++" # Create webserver statichtml 
echo "$count) Create websesrver statichtml..."
source create_vm_statichtml.sh

let "count++" # Create webserver statichtmlwithjs
echo "$count) Create websesrver statichtmlwithjs..."
source create_vm_statichtmlwithjs.sh

let "count++" # Create webserver grafana
echo "$count) Create websesrver grafana..."
source create_vm_grafana.sh

echo "***** Create VMs END *****"