variable "vpc_id" {

}

variable "nat_gw" {

}

variable "lb_info" {

}

variable "internet_gw" {

}

variable "https_default_cert_arn" {

}

variable "ensitf_ng_zone_id" {

}

variable "db_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "5432"
      to_port            = "5432"
      protocol           = "tcp"
      allowed_cidr_block = "10.116.0.0/16"
    }
  }
}

variable "env" {
  default = "staging"
}