# Demo Stage 8 | MIGs using Instance Templates

module "website_health_check" {
    source = "../../../terraform_modules/health_check"
    name = var.website_health_check_name
    port = var.website_health_check_port
    check_interval_sec = var.check_interval_sec
    healthy_threshold  = var.healthy_threshold
    timeout_sec         = var.timeout_sec
    unhealthy_threshold = var.unhealthy_threshold
}

module "grafana_health_check" {
    source = "../../../terraform_modules/health_check"
    name = var.grafana_health_check_name
    port = var.grafana_health_check_port
    check_interval_sec = var.check_interval_sec
    healthy_threshold  = var.healthy_threshold
    timeout_sec         = var.timeout_sec
    unhealthy_threshold = var.unhealthy_threshold
}

module "mig_statichtml" {
    source = "../../../terraform_modules/mig"
    name = var.statichtml_mig_name
    zone = var.zone
    source_instance_template = module.statichtml_instance_template.self_link
    health_check = module.website_health_check.self_link
    target_size = var.statichtml_target_size
    port = var.website_health_check_port
}

module "mig_statichtmlwithjs" {
    source = "../../../terraform_modules/mig"
    name = var.statichtmlwithjs_mig_name
    zone = var.zone
    source_instance_template = module.statichtmlwithjs_instance_template.self_link
    health_check = module.website_health_check.self_link
    target_size = var.statichtmlwithjs_target_size
    port = var.website_health_check_port
}

module "mig_grafana" {
    source = "../../../terraform_modules/mig"
    name = var.grafana_mig_name
    zone = var.zone
    source_instance_template = module.grafana_instance_template.self_link
    health_check = module.grafana_health_check.self_link
    target_size = var.grafana_target_size
    port = var.grafana_health_check_port
}

