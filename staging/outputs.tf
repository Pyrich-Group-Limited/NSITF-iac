output "staging_pub_subnets" {
  value = module.subnets.public_subnets
}

output "staging_priv_subnets" {
  value = module.subnets.private_subnets
}