data "aws_region" "current_region" {}

###################################  clusters  ########################################
resource "aws_ecs_cluster" "cluster1" {
  name = "${var.env}-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  tags = {
    "Environment" = "${var.env}"
  }
}

########## ensitf express ############

module "ensitf_express_sg" {
  source       = "../../modules/security_group"
  rules        = var.ensitf_svc_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-express-${var.env}-sg"
}

module "ensitf_express_svc" {
  service_name               = "prod-ensitf-express"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  metric_name                = "MemoryUtilization"
  add_container_volume       = true
  efs_volume_name            = "storage"
  efs_root_dir               = "express-storage/"
  health_check_success_codes = "200-400"
  efs_file_system_id         = "fs-0ae3507481e4a067d"
  tg_protocol                = "HTTPS"
  container_port             = 443
  tg_port                    = 443
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "prod-ensitf-express"
  desired_count              = 1
  lb_dns_name                = var.prod_lb["lb_dns_name"]
  route53_zone_id            = var.ensitf_ng_zone_id
  listener_arn               = var.prod_lb["listener_arn"][0]
  fqdn                       = "express.idlemindstechnologiesltd.com"
  lb_zone_id                 = var.prod_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.ensitf_express_sg.id]
  alb_arn_suffix             = var.prod_lb["lb_arn_suffix"]
  container_definitions = {
    prod-ensitf-express = {
      image       = "145023120322.dkr.ecr.eu-west-1.amazonaws.com/ensitf-express:staging"
      environment = var.ensitf_express_service_env
      secret      = var.ensitf_express_service_secret
      port        = 443
      command     = []
      volumename  = "storage"
      mount_path  = "/var/www/laravel/storage"
    }
  }
}


########## ensitf optima ############

module "ensitf_optima_sg" {
  source       = "../../modules/security_group"
  rules        = var.ensitf_svc_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-optima-${var.env}-sg"
}

module "ensitf_optima_svc" {
  service_name               = "prod-ensitf-optima"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  add_container_volume       = true
  efs_volume_name            = "storage"
  efs_root_dir               = "optima-storage/"
  health_check_success_codes = "200-400"
  efs_file_system_id         = "fs-0ae3507481e4a067d"
  tg_protocol                = "HTTPS"
  container_port             = 443
  tg_port                    = 443
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "prod-ensitf-optima"
  desired_count              = 1
  lb_dns_name                = var.prod_lb["lb_dns_name"]
  route53_zone_id            = var.ensitf_ng_zone_id
  listener_arn               = var.prod_lb["listener_arn"][0]
  fqdn                       = "optima.idlemindstechnologiesltd.com"
  lb_zone_id                 = var.prod_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.ensitf_optima_sg.id]
  alb_arn_suffix             = var.prod_lb["lb_arn_suffix"]
  container_definitions = {
    prod-ensitf-optima = {
      image       = "145023120322.dkr.ecr.eu-west-1.amazonaws.com/ensitf-optima:staging"
      environment = var.ensitf_express_service_env
      secret      = var.ensitf_express_service_secret
      port        = 443
      command     = []
      volumename  = "storage"
      mount_path  = "/var/www/laravel/storage"
    }
  }
  ####### auto scaling #########
  autoscale_max_capacity = 5
  autoscale_min_capacity = 1
  create_autoscaling     = true
  metric_name            = "CPUUtilization"
  scale_target_value     = 40
}