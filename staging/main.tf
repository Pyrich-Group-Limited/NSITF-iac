module "subnets" {
  source      = "./networking"
  vpc_id      = var.vpc_id
  nat_gw      = var.nat_gw
  internet_gw = var.internet_gw
}


module "ecs" {
  source                = "./ecs"
  staging_lb            = var.lb_info
  ensitf_ng_zone_id     = var.ensitf_ng_zone_id
  pglnigeriaerp_zone_id = var.pglnigeriaerp_zone_id
  vpc_id                = var.vpc_id
  private_subnets       = module.subnets.private_subnets
}

