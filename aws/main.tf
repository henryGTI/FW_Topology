module "network" {
  source = "./topology/network"
}

module "firewall_1" {
  source    = "./topology/firewall_1"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

module "firewall_2" {
  source    = "./topology/firewall_2"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

module "server_1" {
  source    = "./topology/server_1"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

module "server_2" {
  source    = "./topology/server_2"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

module "server_3" {
  source    = "./topology/server_3"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}

module "pc" {
  source    = "./topology/pc"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}
