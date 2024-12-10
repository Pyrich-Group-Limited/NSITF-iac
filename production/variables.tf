variable "vpc_id" {

}

variable "nat_gw" {

}

variable "internet_gw" {

}

variable "https_default_cert_arn" {

}

variable "cert_list" {

}


variable "env" {
  default = "production"
}


variable "ensitf_ng_zone_id" {

}

variable "cv_backend_db_sg_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "3306"
      to_port            = "3306"
      protocol           = "tcp"
      allowed_cidr_block = "10.116.0.0/16"
    }

    "Allow connections from public temp" = {
      from_port          = "3306"
      to_port            = "3306"
      protocol           = "tcp"
      allowed_cidr_block = "0.0.0.0/0"
    }
  }
}