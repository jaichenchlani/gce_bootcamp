module "nat_gateway" {
    source = "../../../terraform_modules/nat"
    name = var.nat_gateway_name
    router = var.router_name
    region = var.region
}
