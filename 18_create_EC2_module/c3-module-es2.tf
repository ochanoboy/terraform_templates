module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name  = "mt-module-demo"
  count = 2
  ami   = data.aws_ami.amzlinux.id

  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"] # default sg VPC
  subnet_id              = "subnet-eddcdzz4" # get public ip from default VPC

  tags = {
    Name        = "Module-Demo"
    Terraform   = "true"
    Environment = "dev"
  }
}
