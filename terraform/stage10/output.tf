output "statichtml_template" {
    value = "${module.statichtml_instance_template.name}"
}
output "statichtmlwithjs_template" {
    value = "${module.statichtmlwithjs_instance_template.name}"
}
output "website_health_check" {
    value = "${module.website_health_check.name}(${module.website_health_check.self_link})"
}
output "mig_statichtml" {
    value = "${module.mig_statichtml.name}(${module.mig_statichtml.self_link})"
}
output "mig_statichtmlwithjs" {
    value = "${module.mig_statichtmlwithjs.name}(${module.mig_statichtmlwithjs.self_link})"
}
output "statichtml_backend_service" {
    value = "${module.lb_statichtml.backend_service}"
}
output "statichtml_load_balancer_global_ip" {
    value = "${module.lb_statichtml.load_balancer_global_ip}"
}
output "statichtmlwithjs_backend_service" {
    value = "${module.lb_statichtmlwithjs.backend_service}"
}
output "statichtmlwithjs_load_balancer_global_ip" {
    value = "${module.lb_statichtmlwithjs.load_balancer_global_ip}"
}
output "router" {
    value = "${module.lb_router.name}"
}
output "nat_gateway" {
    value = "${module.nat_gateway.name}"
}