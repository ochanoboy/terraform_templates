resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  provider = aws.aws-west-1
  tags =  {
    "Name" = "VPC_02"
  }
}
