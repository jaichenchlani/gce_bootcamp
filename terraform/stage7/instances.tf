module "statichtml_instance" {
    source = "../../../terraform_modules/instance_from_template"
    name = var.statichtml_instance_name
    zone = var.zone
    source_instance_template = module.statichtml_instance_template.name
}

module "statichtmlwithjs_instance" {
    source = "../../../terraform_modules/instance_from_template"
    name = var.statichtmlwithjs_instance_name
    zone = var.zone
    source_instance_template = module.statichtmlwithjs_instance_template.name
}

module "grafana_instance" {
    source = "../../../terraform_modules/instance_from_template"
    name = var.grafana_instance_name
    zone = var.zone
    source_instance_template = module.grafana_instance_template.name
}