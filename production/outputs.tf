output "prod_pub_subnets" {
  value = module.subnets.public_subnets
}

output "prod_priv_subnets" {
  value = module.subnets.private_subnets
}

output "prod_lb_info" {
  value = module.ec2.lb_info
}