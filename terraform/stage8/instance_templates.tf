module "statichtmlwithjs_instance_template" {
    source = "../../../terraform_modules/instance_template_web_server"
    name = var.statichtmlwithjs_instance_template_name
    image = var.statichtmlwithjs_image
    network = var.network
    startup_script = "${file(var.statichtmlwithjs_instance_startup_script_file)}"
}

module "statichtml_instance_template" {
    source = "../../../terraform_modules/instance_template_web_server"
    name = var.statichtml_instance_template_name
    image = var.statichtml_image
    network = var.network
    startup_script = "${file(var.statichtml_instance_startup_script_file)}"
}

module "grafana_instance_template" {
    source = "../../../terraform_modules/instance_template_web_server"
    name = var.grafana_instance_template_name
    image = var.grafana_image
    network = var.network
    machine_type = var.grafana_machine_type
}