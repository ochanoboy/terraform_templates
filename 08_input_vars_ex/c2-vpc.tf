#Create VPC Resources: 1)Create VPC -->2)Create Subnet-->3)Create Internet Gateway-->4)Create route table-->5)create route in route table for internet access-->6)associate route table with subnet-->7)create security group in the VPC with port 80,22 as inbound open

# Resource-1: create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc_dev"
  }
}

# Resource-2: create Subnet
resource "aws_subnet" "vpc-dev-public-subnet-1" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.vpc-dev.id
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

# Resource-3: create Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-4: create Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-5: create route in route table for internet access
  
resource "aws_route" "vpc-dev-public-route" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-dev-igw.id
}

# Resource-6: Associate the route table with the subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-aws_route_table_associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
}

# Resource-7: Create Security group
resource "aws_security_group" "dev-vpc-sg" {
  name = "dev-vpc-default-sg-01"
  description = "Dev VPC Default Security Group"
  vpc_id = aws_vpc.vpc-dev.id

  ingress {
      description = "Allow port 22"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

   ingress {
      description = "Allow port 80"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    } 

  egress {
      description = "Allow all IP and Ports"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}