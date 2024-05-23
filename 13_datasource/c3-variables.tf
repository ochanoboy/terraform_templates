# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type = string
  default = "us-east-1"
}

#variable "ec2-ami-id" {
# description = "ami-id"
# type = string
# default = "ami-210ewqkdkdqw="  #Amazon instance AMI ID
#}

variable "ec2_instance_count" {
  description = "ec2-instance count"
  type = number
  default = 1
}