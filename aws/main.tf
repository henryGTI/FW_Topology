module "network" {
  source = "./topology/network"
}

module "firewall_1" {
  source    = "./topology/firewall_1"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

...
