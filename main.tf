# Configure the Terraform provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS provider: default region, awscli config file and credentials for authentication
provider "aws" {
  region                   = var.aws_region
  shared_config_files      = [var.awscli_config]
  shared_credentials_files = [var.awscli_credentials]
}