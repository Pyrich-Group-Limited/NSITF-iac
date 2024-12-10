output "private_subnets" {
  value = module.private.subnet_id
}

output "public_subnets" {
  value = module.public.subnet_id
}