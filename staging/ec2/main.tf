# module "staging_services" {
#   source                 = "../../modules/load_balancer"
#   vpc_id                 = var.vpc_id
#   service_cluster        = "services"
#   subnet_ids             = var.public_subnets
#   load_balancer_type     = "application"
#   internal               = false
#   https_default_cert_arn = var.https_default_cert_arn
#   env                    = "staging"
# }