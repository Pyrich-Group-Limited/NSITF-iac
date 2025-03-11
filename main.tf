resource "aws_vpc" "vpc" {
  cidr_block           = "10.116.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = title("NSITF Prod VPC")
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = title("NSITF prod IGW")
  }
  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_eip" "ngw_eip" {
  tags = {
    "Name" = "NAT Gateway"
  }
  depends_on = [
    aws_internet_gateway.igw
  ]
}


resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = module.production.prod_pub_subnets[1]

  tags = {
    Name = "vpc-nat-gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}


module "production" {
  source                 = "./production"
  vpc_id                 = aws_vpc.vpc.id
  nat_gw                 = aws_nat_gateway.ngw.id
  internet_gw            = aws_internet_gateway.igw.id
  https_default_cert_arn = module.ensitf_ng_acm.cert_arn_dns
  ensitf_ng_zone_id      = module.ensitf_ng_dns.zone_id
  pglnigeriaerp_zone_id  = module.pglnigeriaerp_com_dns.zone_id
  cert_list              = [module.ensitf_ng_acm.cert_arn_dns, module.glnigeriaerp_com_acm.cert_arn_dns]
  depends_on = [
    aws_vpc.vpc
  ]
}

module "staging" {
  source                 = "./staging"
  vpc_id                 = aws_vpc.vpc.id
  nat_gw                 = aws_nat_gateway.ngw.id
  internet_gw            = aws_internet_gateway.igw.id
  https_default_cert_arn = module.ensitf_ng_acm.cert_arn_dns
  ensitf_ng_zone_id      = module.ensitf_ng_dns.zone_id
  lb_info                = module.production.prod_lb_info
  pglnigeriaerp_zone_id  = module.pglnigeriaerp_com_dns.zone_id
  depends_on = [
    aws_vpc.vpc
  ]
}


module "ecr" {
  source   = "./modules/ecr"
  ecr_repo = var.ecr_repo
}


module "ensitf_ng_dns" {
  source       = "./modules/dns"
  hosted_zones = "ensitf.ng"
}

module "ensitf_ng_acm" {
  source                      = "./modules/acm"
  domain_name                 = "ensitf.ng"
  domain_validation_options   = "DNS"
  subject_alternative_names   = ["*.ensitf.ng", "ensitf.ng"]
  wait_for_certificate_issued = false
  dns_zone                    = "ensitf.ng"
  depends_on = [
    module.ensitf_ng_dns
  ]
}

module "pglnigeriaerp_com_dns" {
  source       = "./modules/dns"
  hosted_zones = "pglnigeriaerp.com"
}

module "glnigeriaerp_com_acm" {
  source                      = "./modules/acm"
  domain_name                 = "pglnigeriaerp.com"
  domain_validation_options   = "DNS"
  subject_alternative_names   = ["*.pglnigeriaerp.com", "pglnigeriaerp.com"]
  wait_for_certificate_issued = false
  dns_zone                    = "pglnigeriaerp.com"
  depends_on = [
    module.ensitf_ng_dns
  ]
}