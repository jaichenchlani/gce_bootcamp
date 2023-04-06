output "statichtml_template" {
    value = "${module.statichtml_instance_template.name}"
}
output "statichtmlwithjs_template" {
    value = "${module.statichtmlwithjs_instance_template.name}"
}
output "grafana_template" {
    value = "${module.grafana_instance_template.name}"
}
output "website_health_check" {
    value = "${module.website_health_check.name}(${module.website_health_check.self_link})"
}
output "grafana_health_check" {
    value = "${module.grafana_health_check.name}(${module.grafana_health_check.self_link})"
}
output "mig_statichtml" {
    value = "${module.mig_statichtml.name}(${module.mig_statichtml.self_link})"
}
output "mig_statichtmlwithjs" {
    value = "${module.mig_statichtmlwithjs.name}(${module.mig_statichtmlwithjs.self_link})"
}
output "mig_grafana" {
    value = "${module.mig_grafana.name}(${module.mig_grafana.self_link})"
}