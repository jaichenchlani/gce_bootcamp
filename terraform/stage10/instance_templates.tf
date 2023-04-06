module "statichtmlwithjs_instance_template" {
    source = "../../../terraform_modules/instance_template_no_external_ip"
    name = var.statichtmlwithjs_instance_template_name
    image = var.statichtmlwithjs_image
    network = var.network
    startup_script = "${file(var.statichtmlwithjs_instance_startup_script_file)}"
}

module "statichtml_instance_template" {
    source = "../../../terraform_modules/instance_template_no_external_ip"
    name = var.statichtml_instance_template_name
    image = var.statichtml_image
    network = var.network
    startup_script = "${file(var.statichtml_instance_startup_script_file)}"
}