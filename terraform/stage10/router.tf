module "lb_router" {
    source = "../../../terraform_modules/router"
    name = var.router_name
    network = var.network
    region = var.region
}
