variable "certificate_transparency_logging_preference" {
  default = "ENABLED"
}

variable "domain_name" {
  default = "example.com"
}

variable "domain_validation_options" {
  default = "DNS"
}

variable "subject_alternative_names" {
  default = ["*.example.com", "example.com"]
}

variable "env" {
  default = "dev"
}

variable "process_domain_validation_options" {
  default = false
}

variable "wait_for_certificate_issued" {
  default = true
}

variable "ttl" {
  default = 300
}

variable "dns_zone" {
  default = "example.com"
}