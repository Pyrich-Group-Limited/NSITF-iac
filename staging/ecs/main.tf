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



########## ensitf ebs ############

module "ensitf_ebs_sg" {
  source       = "../../modules/security_group"
  rules        = var.ensitf_svc_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-ebs-${var.env}-sg"
}

module "ensitf_ebs_svc" {
  service_name               = "staging-ensitf-ebs"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  metric_name                = "MemoryUtilization"
  add_container_volume       = true
  efs_volume_name            = "storage"
  efs_root_dir               = "staging/ebs/storage"
  health_check_success_codes = "200-400"
  efs_file_system_id         = "fs-02b447f5e571cb87b"
  tg_protocol                = "HTTPS"
  container_port             = 443
  tg_port                    = 443
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "staging-ensitf-ebs"
  desired_count              = 1
  lb_dns_name                = var.staging_lb["lb_dns_name"]
  route53_zone_id            = var.ensitf_ng_zone_id
  listener_arn               = var.staging_lb["listener_arn"][0]
  fqdn                       = "ebs.ensitf.ng"
  lb_zone_id                 = var.staging_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.ensitf_ebs_sg.id]
  alb_arn_suffix             = var.staging_lb["lb_arn_suffix"]
  container_definitions = {
    staging-ensitf-ebs = {
      image       = "746669210359.dkr.ecr.eu-west-1.amazonaws.com/ebs:staging"
      environment = var.ensitf_ebs_service_env
      secret      = var.ensitf_ebs_service_secret
      port        = 443
      command     = []
      volumename  = "storage"
      mount_path  = "/var/www/laravel/storage"
    }
  }
}


########## ensitf essp ############

module "ensitf_essp_sg" {
  source       = "../../modules/security_group"
  rules        = var.ensitf_svc_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-optima-${var.env}-sg"
}

module "ensitf_essp_svc" {
  service_name               = "staging-ensitf-essp"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  health_check_path          = "/login"
  metric_name                = "MemoryUtilization"
  add_container_volume       = true
  efs_volume_name            = "storage"
  efs_root_dir               = "staging/essp/storage"
  health_check_success_codes = "200-400"
  efs_file_system_id         = "fs-02b447f5e571cb87b"
  tg_protocol                = "HTTPS"
  container_port             = 443
  tg_port                    = 443
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "staging-ensitf-essp"
  desired_count              = 1
  lb_dns_name                = var.staging_lb["lb_dns_name"]
  route53_zone_id            = var.ensitf_ng_zone_id
  listener_arn               = var.staging_lb["listener_arn"][0]
  fqdn                       = "essp.ensitf.ng"
  lb_zone_id                 = var.staging_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.ensitf_essp_sg.id]
  alb_arn_suffix             = var.staging_lb["lb_arn_suffix"]
  container_definitions = {
    staging-ensitf-essp = {
      image       = "746669210359.dkr.ecr.eu-west-1.amazonaws.com/essp:staging"
      environment = var.ensitf_essp_service_env
      secret      = var.ensitf_essp_service_secret
      port        = 443
      command     = []
      volumename  = "storage"
      mount_path  = "/var/www/laravel/storage"
    }
  }
}

########## ensitf servicom ############

module "ensitf_servicom_sg" {
  source       = "../../modules/security_group"
  rules        = var.ensitf_servicom_svc_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-servicom-${var.env}-sg"
}

module "ensitf_servicom_svc" {
  service_name               = "staging-ensitf-servicom"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  health_check_path          = "/login"
  metric_name                = "MemoryUtilization"
  health_check_success_codes = "200-400"
  efs_file_system_id         = "fs-02b447f5e571cb87b"
  container_port             = 80
  tg_port                    = 80
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "staging-ensitf-servicom"
  desired_count              = 1
  lb_dns_name                = var.staging_lb["lb_dns_name"]
  route53_zone_id            = var.ensitf_ng_zone_id
  listener_arn               = var.staging_lb["listener_arn"][0]
  fqdn                       = "servicom.ensitf.ng"
  lb_zone_id                 = var.staging_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.ensitf_servicom_sg.id]
  alb_arn_suffix             = var.staging_lb["lb_arn_suffix"]
  container_definitions = {
    staging-ensitf-servicom = {
      image       = "746669210359.dkr.ecr.eu-west-1.amazonaws.com/servicom:staging"
      environment = var.ensitf_servicom_service_env
      secret      = var.ensitf_servicom_service_secret
      port        = 80
      command     = []
    }
  }
}


########## ensitf web ############

module "ensitf_web_sg" {
  source       = "../../modules/security_group"
  rules        = var.ensitf_servicom_svc_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-web-${var.env}-sg"
}

module "ensitf_web_svc" {
  service_name               = "staging-ensitf-web"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  health_check_path          = "/login"
  metric_name                = "MemoryUtilization"
  health_check_success_codes = "200-499"
  efs_file_system_id         = "fs-02b447f5e571cb87b"
  container_port             = 80
  tg_port                    = 80
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "staging-ensitf-web"
  desired_count              = 1
  lb_dns_name                = var.staging_lb["lb_dns_name"]
  route53_zone_id            = var.ensitf_ng_zone_id
  listener_arn               = var.staging_lb["listener_arn"][0]
  fqdn                       = "web.ensitf.ng"
  lb_zone_id                 = var.staging_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.ensitf_web_sg.id]
  alb_arn_suffix             = var.staging_lb["lb_arn_suffix"]
  container_definitions = {
    staging-ensitf-web = {
      image       = "746669210359.dkr.ecr.eu-west-1.amazonaws.com/ensitf-web:staging"
      environment = null
      secret      = null
      port        = 80
      command     = []
    }
  }
}


########## erp service ############

module "erp_svc_sg" {
  source       = "../../modules/security_group"
  rules        = var.erp_svc_rules
  vpc_id       = var.vpc_id
  service_name = "erp-svc-${var.env}-sg"
}

module "staging_erp_svc" {
  service_name               = "staging-erp-svc"
  source                     = "../../modules/ecs"
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.private_subnets
  health_check_path          = "/login"
  metric_name                = "MemoryUtilization"
  health_check_success_codes = "200-400"
  container_port             = 443
  tg_port                    = 443
  tg_protocol                = "HTTPS"
  tg_unhealthy_threshold     = 5
  tg_healthy_threshold       = 2
  tg_name                    = "staging-erp-svc"
  desired_count              = 1
  lb_dns_name                = var.staging_lb["lb_dns_name"]
  route53_zone_id            = var.pglnigeriaerp_zone_id
  listener_arn               = var.staging_lb["listener_arn"][0]
  fqdn                       = "erp-staging.pglnigeriaerp.com"
  lb_zone_id                 = var.staging_lb["lb_zone_id"]
  ecs_cluster                = aws_ecs_cluster.cluster1.arn
  compute_info               = [256, 512]
  security_groups            = [module.erp_svc_sg.id]
  alb_arn_suffix             = var.staging_lb["lb_arn_suffix"]
  container_definitions = {
    staging-erp-svc = {
      image       = "746669210359.dkr.ecr.eu-west-1.amazonaws.com/erp:staging"
      environment = var.erp_svc_env
      secret      = var.erp_svc_secrets
      port        = 443
      command     = []
    }
  }
}