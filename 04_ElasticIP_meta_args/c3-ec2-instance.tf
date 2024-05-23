# Create EC-2 Instance:
resource "aws_instance" "ec2_instanc-dev-01" {
  ami = "ami-4442asdosk23ewdaksd"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [ aws_security_group.dev-vpc-sg.id ]
  #user_data = file("apache-install.sh")
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo systemctl enable httpd
    echo "<h1> Welcome! </h1>" > /var/www/html/index.html
  EOF
}