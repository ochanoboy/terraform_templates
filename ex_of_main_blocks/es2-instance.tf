# Settings Block
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        #version = 
    }
  }
}

# Provider Block
provider "aws" {
    profile = "default"
    region = "us-east-1"
}

# Resource Block
resource "aws_instance" "test-instance01" {
    ami           = "ami-123456789"   // check in aws console and copy
    instance_type = "t2.micro"
}

