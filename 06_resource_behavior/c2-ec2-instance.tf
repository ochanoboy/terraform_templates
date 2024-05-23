# Resource block (create EC-2 instance)
resource "aws_instance" "ec2_test_vm_01" {
  ami = "ami-weoqwekqwoekqwoekqwoekqwoe134"
  instance_type = "t2.micro"
  tags = {
    "Name" = "ec2_test_vm_01"
    "tag1" = "update_tag_01"
  }
  availability_zone = "us-east-1a"
}