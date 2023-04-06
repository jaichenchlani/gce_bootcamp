module "lb_statichtml" {
    source = "../../../terraform_modules/http_load_balancer"
    backend_mig_name = module.mig_statichtml.instance_group
    backend_service_name = var.statichtml_backend_service_name
    health_checks = [module.website_health_check.self_link]
    url_map_name = var.statichtml_url_map_name
    proxy_name = var.statichtml_proxy_name
    lb_ipv4_name = var.statichtml_lb_ipv4_name
    forwarding_rule_name = var.statichtml_forwarding_rule_name
}

module "lb_statichtmlwithjs" {
    source = "../../../terraform_modules/http_load_balancer"
    backend_mig_name = module.mig_statichtmlwithjs.instance_group
    backend_service_name = var.statichtmlwithjs_backend_service_name
    health_checks = [module.website_health_check.self_link]
    url_map_name = var.statichtmlwithjs_url_map_name
    proxy_name = var.statichtmlwithjs_proxy_name
    lb_ipv4_name = var.statichtmlwithjs_lb_ipv4_name
    forwarding_rule_name = var.statichtmlwithjs_forwarding_rule_name
}