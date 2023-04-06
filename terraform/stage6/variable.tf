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
    default         = null
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