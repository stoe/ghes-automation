# AWS ------------------------------------------------------------------------------------------------------------------
aws_region           = "eu-central-1"
aws_profile          = "default"
aws_credentials_file = "/path/to/aws/creds"


# Stack ----------------------------------------------------------------------------------------------------------------
tags = {
  "Owner"   = "owner"
  "Contact" = "owner@example.com"
  "Team"    = "team"
  "Project" = "GitHub Enterprise Server Proof of Concept"
}

vpc_id     = "vpc-285de443"


# GitHub Enterprise Server ---------------------------------------------------------------------------------------------
ghes_version          = "3.1"
ghes_azs              = ["eu-central-1a", "eu-central-1b"]
ghes_instance_type    = "r5.xlarge"
ghes_data_volume_size = 200


# Backup Utils ---------------------------------------------------------------------------------------------------------
backup_utils_az          = "eu-central-1c"
backup_utils_volume_size = 50
