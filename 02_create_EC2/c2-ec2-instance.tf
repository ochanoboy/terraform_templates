# Resource block (create EC-2 instance)
resource "aws_instance" "my-ec2-vm" {
  ami = var.ec2-ami-id
  instance_type = "t3.micro"
  count = var.ec2_instance_count
  key_name = "terraform-key"
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  tags = {
    "Name" = "myec2vm"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo systemctl enable httpd
    echo "<h1> Welcome! </h1>" > /var/www/html/index.html
  EOF 
}