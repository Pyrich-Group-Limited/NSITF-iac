variable "public_subnets" {
  type = map(any)
  default = {
    public_subnet = {
      subnets   = ["10.116.20.0/22", "10.116.24.0/22"]
      is_public = true
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    private_subnets = {
      subnets   = ["10.116.28.0/22", "10.116.32.0/22"]
      is_public = false
    }
  }
}

variable "vpc_id" {

}

variable "env" {
  default = "production"
}

variable "nat_gw" {

}

variable "staging_private_routes" {
  type = map(any)
  default = {
    route1 = {
      "route" = ["0.0.0.0/0", "nat_gw"]
    }
  }
}

variable "staging_public_routes" {
  type = map(any)
  default = {
    route1 = {
      "route" = ["0.0.0.0/0", "internet_gw"]
    }
  }
}

variable "internet_gw" {

}