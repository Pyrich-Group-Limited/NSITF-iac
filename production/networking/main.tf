module "public" {
  source   = "../../modules/subnets"
  vpc_id   = var.vpc_id
  env      = var.env
  networks = var.public_subnets
}

module "private" {
  source   = "../../modules/subnets"
  vpc_id   = var.vpc_id
  env      = var.env
  networks = var.private_subnets
}

module "private_rt" {
  source     = "../../modules/route_table"
  env        = var.env
  service    = ""
  subnet_ids = module.private.subnet_id
  gateways   = ["${var.nat_gw}:nat_gw"]
  vpc_id     = var.vpc_id
  routes     = var.staging_private_routes
  is_public  = false
}


module "public_rt" {
  source     = "../../modules/route_table"
  env        = var.env
  service    = ""
  subnet_ids = module.public.subnet_id
  gateways   = ["${var.internet_gw}:internet_gw"]
  vpc_id     = var.vpc_id
  routes     = var.staging_public_routes
  is_public  = true
}