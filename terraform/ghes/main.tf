terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.10, <4.0"
    }
  }
}

locals {
  tags = merge(
    map("Environment", terraform.workspace),
    var.tags
  )
}

# ----------------------------------------------------------------------------------------------------------------------
# Providers
# ----------------------------------------------------------------------------------------------------------------------
# https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {
  region                  = var.aws_region
  profile                 = var.aws_profile
  shared_credentials_file = var.aws_credentials_file
}

# ----------------------------------------------------------------------------------------------------------------------
# Build instances
# ----------------------------------------------------------------------------------------------------------------------
module "ghes" {
  source = "git@github.com:stoe/terraform-module-ghes.git"

  vpc_id                = var.vpc_id
  name                  = "stoe-ghes"
  tags                  = local.tags
  ghes_region           = var.aws_region
  ghes_azs              = ["${var.aws_region}a", "${var.aws_region}b"]
  ghes_instance_type    = var.ghes_instance_type
  ghes_data_volume_type = var.ghes_data_volume_type
  ghes_data_volume_size = var.ghes_data_volume_size
  ghes_version          = var.ghes_version
}
