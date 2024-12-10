provider "aws" {
  region = "eu-west-1"
}

module "backend" {
  source = "./modules/providers"
}

terraform {
  backend "s3" {
    bucket         = "ensitf-terraform-statefile"
    dynamodb_table = "production-tf-state-lock"
    encrypt        = true
    key            = "production/statefile"
    region         = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

provider "random" {
  # Configuration options
}