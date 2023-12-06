## Create the VMs using gcloud commands
Stage 4 | Complete automation using bash scripts

### Setup Variables
project_id=<YOUR_PROJECT>  
zone=<YOUR_ZONE> 
machine_type=n1-standard-1 # You can change to a different machine-type if you'd like
scopes=https://www.googleapis.com/auth/cloud-platform
debian_image=projects/debian-cloud/global/images/debian-11-bullseye-v20230306  
centos_image=projects/centos-cloud/global/images/centos-7-v20230306  
ni_external_ip="network-tier=PREMIUM,subnet=default"  

### gcloud command
vm_name=vm-statihtml
vm_name=vm-statichtmlwithjs
vm_name=vm-grafana

gcloud compute instances create $vm_name \
    --project=$project_id \
    --zone=$zone \
    --machine-type=$machine_type \
    --network-interface=$ni_external_ip \
    --tags=web-server \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --scopes=$scopes \
    --create-disk=auto-delete=yes,boot=yes,device-name=$vm_debian,image=$debian_image,mode=rw,size=10,type=projects/$project_id/zones/$zone/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=provisioned_by=gcloud \
    --reservation-affinity=any \
    --metadata-from-file startup-script="<COMPLETE_PATH_TO_THE_STARTUP_SCRIPT>"