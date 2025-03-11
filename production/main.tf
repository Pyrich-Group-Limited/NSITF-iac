module "subnets" {
  source      = "./networking"
  vpc_id      = var.vpc_id
  nat_gw      = var.nat_gw
  internet_gw = var.internet_gw
}

module "ec2" {
  source                 = "./ec2"
  public_subnets         = module.subnets.public_subnets
  vpc_id                 = var.vpc_id
  https_default_cert_arn = var.https_default_cert_arn
  cert_list              = var.cert_list
  depends_on = [
    module.subnets
  ]
}

############## subnet, option and parameter groups ##############
resource "aws_db_subnet_group" "production_subnet_group" {
  name        = "${var.env}-subnet-group"
  description = "${var.env}-subnet-group"
  subnet_ids  = module.subnets.private_subnets
  tags = {
    "Environment" = "${var.env}"
  }
}

resource "aws_db_subnet_group" "production_public_subnet_group" {
  name        = "${var.env}-public-subnet-group"
  description = "${var.env}-public-subnet-group"
  subnet_ids  = module.subnets.public_subnets
  tags = {
    "Environment" = "${var.env}"
  }
}

resource "aws_db_option_group" "production_option_group_mysql_8" {
  name                     = "${var.env}-option-group-mysql-8"
  option_group_description = "${var.env}-option-group-mysql-8"
  engine_name              = "mysql"
  major_engine_version     = "8.0"
  tags = {
    "Environment" = "${var.env}"
  }
}

resource "aws_db_parameter_group" "production_parameter_group_mysql_8" {
  name        = "${var.env}-parameter-group-mysql-8"
  description = "${var.env}-parameter-group-mysql-8"
  family      = "mysql8.0"
  tags = {
    "Environment" = "${var.env}"
  }
}

module "ensitf_production_db_sg" {
  source       = "../modules/security_group"
  rules        = var.cv_backend_db_sg_rules
  vpc_id       = var.vpc_id
  service_name = "ensitf-db"
}

module "cv_backend_production_db" {
  source                = "../modules/rds/rds_instance"
  db_identifier         = "ensitf-production-db"
  service_name          = "ensitf-prod"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  default_db_name       = "ensitf_production"
  admin_username        = "ensitf_admin"
  admin_password        = "default"
  storage_encrypted     = true
  max_allocated_storage = 1000
  storage_type          = "gp3"
  db_security_group_id  = module.ensitf_production_db_sg.id
  db_subnet_group_name  = aws_db_subnet_group.production_public_subnet_group.name
  parameter_group_name  = aws_db_parameter_group.production_parameter_group_mysql_8.name
  publicly_accessible   = true
  apply_immediately     = true
}

module "ecs" {
  source                = "./ecs"
  prod_lb               = module.ec2.lb_info
  ensitf_ng_zone_id     = var.ensitf_ng_zone_id
  vpc_id                = var.vpc_id
  private_subnets       = module.subnets.private_subnets
  pglnigeriaerp_zone_id = var.pglnigeriaerp_zone_id
}