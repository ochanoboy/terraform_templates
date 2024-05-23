# Output Values

#EC2 Public IP
output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.my-ec2-vm.public_ip
}

#EC2 Private IP
output "ec2_instance_privateip" {
  description = "EC2 Instnce Private IP"
  value = aws_instance.my-ec2-vm.private_ip
}

#EC2 Security Group
output "ec2_instance_security_group" {
  description = "List Security Groups for EC2 Instance"
  value = aws_instance.my-ec2-vm.security_groups
}

#EC3 Public DNS
output "ec2_publicdns" {
  description = "Public DNS URL for EC2 instnace"
  value = "http://${aws_instance.my-ec2-vm.public_dns}"
  sensitive = true # If use terraform output you can check value
}