# Demo Stage 6 | Create Instances directly
module "statichtml_instance" {
    source = "../../../terraform_modules/instance"
    name = var.statichtml_instance_name
    startup_script = "${file(var.statichtml_instance_startup_script_file)}"
    image = var.statichtml_image
    network = var.network
}

module "statichtmlwithjs_instance" {
    source = "../../../terraform_modules/instance"
    name = var.statichtmlwithjs_instance_name
    startup_script = "${file(var.statichtmlwithjs_instance_startup_script_file)}"
    image = var.statichtmlwithjs_image
    network = var.network
}

module "grafana_instance" {
    source = "../../../terraform_modules/instance"
    name = var.grafana_instance_name
    image = var.grafana_image
    network = var.network
}