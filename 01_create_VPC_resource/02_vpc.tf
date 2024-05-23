# Resource block
# 01 Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags =  {
    "Name" = "VPC_01"
  }
}
