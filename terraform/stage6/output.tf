output "statichtml_name" {
    value = "${module.statichtml_instance.name}"
}
output "statichtml_external_ip" {
    value = "${module.statichtml_instance.external_ip}"
}
output "statichtmlwithjs_name" {
    value = "${module.statichtmlwithjs_instance.name}"
}
output "statichtmlwithjs_external_ip" {
    value = "${module.statichtmlwithjs_instance.external_ip}"
}
output "grafana_name" {
    value = "${module.grafana_instance.name}"
}
output "grafana_external_ip" {
    value = "${module.grafana_instance.external_ip}"
}