variable "ecr_repo" {
  type = map(any)
  default = {
    essp = {
      image_tag_mutability     = true
      image_scan_on_push       = true
      encryption_type          = "AES256"
      attach_repository_policy = false
      create_lifecycle_policy  = false
    },
    ebs = {
      image_tag_mutability     = true
      image_scan_on_push       = true
      encryption_type          = "AES256"
      attach_repository_policy = false
      create_lifecycle_policy  = false
    },
    servicom = {
      image_tag_mutability     = true
      image_scan_on_push       = true
      encryption_type          = "AES256"
      attach_repository_policy = false
      create_lifecycle_policy  = false
    },
    ensitf-web = {
      image_tag_mutability     = true
      image_scan_on_push       = true
      encryption_type          = "AES256"
      attach_repository_policy = false
      create_lifecycle_policy  = false
    }
  }
}

variable "vpn_rules" {
  default = {
    "Allow connections from local" = {
      from_port          = "0"
      to_port            = "0"
      protocol           = "-1"
      allowed_cidr_block = "0.0.0.0/0"
    }
  }
}