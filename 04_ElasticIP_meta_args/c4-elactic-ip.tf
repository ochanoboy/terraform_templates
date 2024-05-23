# Create Elastic IP Resource with depends_on Meta-Argument
resource "aws_eip" "dev01-aws_eip" {
  instance = aws_instance.ec2_instanc-dev-01.id
  vpc = true
  # Meta-Argument
  depends_on = [ aws_internet_gateway.vpc-dev-igw ]
}
