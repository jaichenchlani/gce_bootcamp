#!/bin/bash
# Start up script for the Packer Built Centos Static HTML Page Image

echo "START" | systemd-cat -t startup_script -p 4

### Webserver Configuration Files Location
config_files_location="gs://codegarage-001-app-config-files-001/webserver-centos"

# Initialize the counter
count=0

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

let "count++" # Increment the counter
echo "Start httpd service..."  | systemd-cat -t startup_script -p 5
sudo systemctl start httpd
if [ $? -ne 0 ]; then
    echo "Failed." | systemd-cat -t startup_script -p 3
else
	echo "Completed successfully." | systemd-cat -t startup_script -p 6
fi

echo "END" | systemd-cat -t startup_script -p 4