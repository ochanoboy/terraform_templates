# Terraform block
terraform {
  required_version = "~>0.14.3"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.0.0"
    }
  }
}

# First Provider block for us-east-1
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
