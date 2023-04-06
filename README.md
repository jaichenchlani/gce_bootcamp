# Jai Chenchlani's Udemy Course Demo Code
Google Cloud | GCE Reliability Engineering using Terraform

## Introduction
All the code used for the demos for the Udemy Course
https://www.udemy.com/course/google-cloud-gce-reliability-engineering-using-terraform

## Setup Instructions
1. Download the Compute Engine default service account key, and save it as *credentials.json* in the root folder. Refer [sa_key_download](sa_key_download.png)
2. Navigate to packer folder and run the following commands
    1. `packer build -force statichtml.centos.packer.json` Build the statichtml webserver image
    2. `packer build -force statichtmlwithjs.debian.packer.json` Build the statichtmlwithjs webserver image
    3. `packer build -force grafana.debian.packer.json` Build the grafana image
2. Terraform Config Modifications
    - `global.tfvars` Modify to match your project details
    - Update `backend.tf` in *all stages folders* to change the bucket name to your gcs bucket
    - Update `variable.tf` in *all stages folders* to change the project name to your project

## Test and Validate Instructions
Navigate to *each stage folder*, and run the following commands:
1. `terraform init` validate for successful completion. Resolve errors.
2. `terraform plan --var-file ../global.tfvars` validate output
3. `terraform apply` to create the resources
4. `terraform state list` should show the resources created per the plan
5. `terraform destroy` to create the resources

## Folders

### packer
Packer build json configurations for both statichtml and statichtmlwithjs websites.

### scripts
- startup and install scripts for debian, centos, grafana

### terraform
- Terraform configuration for instance creation
- Backend is GCS
- Uses the terraform_modules from the sre repo.

#### Stage 6
- Introduced Terraform. 
- Create instances using the Instance module (not the instance templates)

#### Stage 7 
- Introduced Instance Templates
- Create instances from Instance template; MIGs not created yet

#### Stage 8 
- Introduced MIGs
- Create MIGs that use the Instance templates

#### Stage 9 
- Introduced Load Balancers
- Create HTTP Load Balancers that uses MIGs as backends

#### Stage 10
- Configured only for the web apps - statichtml and statichtmlwithjs
- Get rid of external ips
- Implement Cloud NAT
- Configure DNS (manually, not in the terraform scripts)

### demo_apps
Demo Apps for various Stages
- [static-html](static-html.png) - Static HTML website with no JS.
- [static-html-with-js](static-html-with-js.png) - Static HTML website with JS.

### images
Images referenced in the markdown files
