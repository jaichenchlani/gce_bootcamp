#!/bin/bash

. config_file

echo $key1

echo $key2

echo $webserve_centos_config_files

echo $webserve_debian_config_files

gsutil ls $webserve_centos_config_files/*