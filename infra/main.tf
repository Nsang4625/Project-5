module "network" {
  source = "./network"
  region = "sgp1"
}

module "instances" {
  source = "./instances"
  vpc_id = module.network.vpc_id
}

module "cluster" {
  source = "./cluster"
  region = "sgp1"
  vpc_id = module.network.vpc_id
}