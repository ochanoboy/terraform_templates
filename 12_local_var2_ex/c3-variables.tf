# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type = string
  default = "us-east-1"
}


# APP Name S3 Bucket used for
variable "app_name" {
  description = "Application_name"
  type = string
}

#Environment name
variable "environment_name" {
  description = "Environment Name"
  type = string
}