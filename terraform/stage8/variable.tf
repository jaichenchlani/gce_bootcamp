variable "project" { 
    type            = string
    default         = "codegarage-381602"
}

variable "region" { 
    type            = string
    default         = null
}

variable "zone" { 
    type            = string
    default         = "us-east1-b"
}

variable "network" { 
    type            = string
    default         = "default"
}

variable "environment" { 
    type            = string
    default         = null
}

variable "statichtml_instance_name" {
    type            = string
    default         = "statichtml-centos"
}

variable "source_instance_template" { 
    type            = string
    default         = null
}

variable "statichtml_instance_template_name" {
    type            = string
    default         = "statichtml-centos"
}

variable "statichtml_instance_template_description" {
    type            = string
    default         = "statichtml instance template."
}

variable "statichtmlwithjs_instance_name" {
    type            = string
    default         = "statichtmlwithjs-debian"
}

variable "grafana_instance_name" {
    type            = string
    default         = "grafana-debian"
}

variable "statichtmlwithjs_instance_template_name" {
    type            = string
    default         = "statichtmlwithjs-debian"
}

variable "grafana_instance_template_name" {
    type            = string
    default         = "grafana-debian"
}

variable "grafana_machine_type" {
  type = string
  default = "n1-standard-2"
}

variable "statichtmlwithjs_instance_template_description" {
    type            = string
    default         = "statichtmlwithjs instance template."
}

variable "statichtml_instance_startup_script_file" { 
    type            = string
    default         = "/Users/jai/mydata/technical/business/courses/gce_bootcamp/demos/scripts/startup_script_statichtml_centos.sh"
}

variable "statichtmlwithjs_instance_startup_script_file" { 
    type            = string
    default         = "/Users/jai/mydata/technical/business/courses/gce_bootcamp/demos/scripts/startup_script_statichtmlwithjs_debian.sh"
}

variable "statichtml_image" { 
    type            = string
    default         = "statichtml-centos"
}

variable "statichtmlwithjs_image" { 
    type            = string
    default         = "statichtmlwithjs-debian"
}

variable "grafana_image" { 
    type            = string
    default         = "grafana-debian"
}

# Health Check Variables

variable "website_health_check_name" { 
    type            = string
    default         = "website-health-check"
}

variable "website_health_check_port" { 
    type            = number
    default         = 80
}

# Need a separate health check for Grafana, 
# as it runs on port 3000 (our websites run on 80)
variable "grafana_health_check_name" { 
    type            = string
    default         = "grafana-health-check"
}

variable "grafana_health_check_port" { 
    type            = number
    default         = 3000
}

variable "check_interval_sec" { 
    type            = number
    default         = 5
}

variable "healthy_threshold" { 
    type            = number
    default         = 2
}

variable "timeout_sec" { 
    type            = number
    default         = 5
}

variable "unhealthy_threshold" { 
    type            = number
    default         = 2
}

# MIG Variables

variable "statichtml_mig_name" { 
    type            = string
    default         = "mig-statichtml"
}

variable "statichtmlwithjs_mig_name" { 
    type            = string
    default         = "mig-statichtmlwithjs"
}

variable "grafana_mig_name" { 
    type            = string
    default         = "mig-grafana"
}

variable "statichtml_target_size" { 
    type            = number
    default         = 1
}

variable "statichtmlwithjs_target_size" { 
    type            = number
    default         = 1
}

variable "grafana_target_size" { 
    type            = number
    default         = 2
}
