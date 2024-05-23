# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type = string
  default = "us-east-01"
}

variable "ec2_instance_count" {
  description = "EC2 Instance count"
  type = number
  default = 2
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-39434914r"
}

# Validation Rules
variable "ec2_ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-39434914r"
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0 , 4) == "ami-"
    error_message = "The ec2_ami_id  value should be a valid AMI id"
  }
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}


# Sensitive Input Variables
