##############################################################
# Block-1: Terrafornm Settings Block
terraform {
  required_version = "~> 0.14" // need to be same version as Terraform CLI on desktop
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>3.0"
    }
  }
# Adding Backend as S3 for Remote State Storage with State Locking
backend "s3" {
    bucket = "terraform-stacksimplify"
    key = "dev2/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "terraform-dev-state-table"
  }
}
##############################################################
# Block-2: Provider Block
provider "aws" {
    profile = "default"  // AWS Credentials Profile configured on local desktop terminal
    region = "us-east-1"
}
##############################################################
# Block-3: Resource Block
resource "aws_instance" "pivo_instance" {
  ami = "ami-123213qwweoqwe" // some ami
  instance_type = var.instance_type
}
##############################################################
# Block-4: Input Variables Block
variable "instance_type" {
    default = "t2.micro"
    description = "EC2 Instance Type"
    type = string
}
##############################################################
# Block-5: Input Variables Block
output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.pivo_instance.public_ip
}
##############################################################
# Block-6: Local Values Block
# Create S3 Bucket - with Input Variables & Local Values
locals {
  bucket-name-prefix = "${var.app_name}-${var.environment_name}"
}
##############################################################
# Block-7: Data Sources Block
# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvn-*"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x84_64"]
  }

}
##############################################################
# Block-8: Modules Block
