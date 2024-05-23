# Create EC2 Instance
resource "aws_instance" "web" {
    ami = "ami-wqekqwekads123123"
    instance_type = "t2.micro"
    count = 5
    tags = {
        "Name" = "ec2-web-${count.index}"
    }
}