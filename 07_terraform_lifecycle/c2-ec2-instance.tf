# Create EC2 Instance (change ami image to check the result after apply)
resource "aws_instance" "web" {
    ami = "ami-wqekqwekads123123"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "ec2-web-${count.index}"
    }
    lifecycle {
      create_before_destroy = true
    }
}


# Create EC2 Instance (if we try destroy resource, resource will not to be destroed) terraform destroy)
resource "aws_instance" "web" {
    ami = "ami-wqekqwekads123123"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "ec2-web-${count.index}"
    }
    lifecycle {
      prevent_destroy = true
    }
}

# Create EC2 Instance (if we change related arguments terraform do not check desire changes in real infra according related arguments)
resource "aws_instance" "web" {
    ami = "ami-wqekqwekads123123"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "ec2-web-${count.index}"
    }
    lifecycle {
      ignore_changes = [ tags, avaliavility_zone ]
    }
/*
    lifecycle {
      ignore_changes = all
    }
*/    
}