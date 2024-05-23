variable "ec2_ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-39434914r"
}

variable "db_username"  {
    description = "AWS RDS Admin User"
    type = string
    sensetive = true

}

variable "db_pswd"  {
    description = "AWS RDS Admin User Pswd"
    type = string
    sensetive = true
    
}