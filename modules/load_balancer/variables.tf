
variable "create_https_lister" {
  default = true
}

variable "listeners" {
  type = map(any)
  default = {
    listener1 = {
      port     = "443"
      protocol = "HTTPS"
    }
  }

}

variable "cert_list" {

}

variable "internal" {
  default = false
}

variable "https_default_cert_arn" {
  default = null
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-2016-08"
}

variable "vpc_id" {

}

variable "env" {
  default = "staging"
}

variable "service_cluster" {

}

variable "subnet_ids" {

}

variable "create_http_listener" {
  default = true
}

variable "lb_sg_description" {
  default = "Allow public web traffic on HTTP/HTTPS to ECS Dev Frontend Web App"
}

variable "load_balancer_type" {
  default = "application"
}

variable "security_group" {
  default = "default"
}

variable "additional_cert" {
  default = null
}

variable "certificate_arn" {
  default = null
}