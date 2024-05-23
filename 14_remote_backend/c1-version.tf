# Terraform Block
terraform {
    required_version = ">= 1.4"
    required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
        }
    }


# Adding Backend as S3 for Remote State Backend

    backend "S3" {
        bucket = "my-terra-bucket"
        key = "workspace/terraform.tfstate"
        region = "us-east-01"
        dynamodb-table = "terraform-dev-state-table"
}

}

# Provider Block
provider "aws" {
    region  = var.aws_region
    profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal
$HOME/.aws/credentials
*/
