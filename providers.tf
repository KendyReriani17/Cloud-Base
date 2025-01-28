terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  shared_config_files      = ["~/.aws/configuration"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "Tuser"
  region                   = "us-west-2"
}