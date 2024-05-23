# Create EC2 Instance - Amazon Linux

resource "aws_instance" "my-ec2-vm" {
  ami = data.aws_ami.amzlinux
  instance_type = var.instance_type
  key_name = "terraform-key"
  count = terraform.workspace == "default" ? 2 : 1 #if workspace=default - create 2 instance, if other -create 1 instance
  user_data = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}-${count.index}"
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  }


 # Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
    on_failure = fail
  }

  # Copies the string in content into /tmp/file.log
  provisioner "file" {
    content     = "ami used: ${self.ami}" # Understand what is "self"
    destination = "/tmp/file.log"
    on_failure = continue
  }

  # Copies the app1 folder to /tmp - FOLDER COPY
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }

  # Copies all files and folders in apps/app2 to /tmp - CONTENTS of FOLDER WILL BE COPIED
  provisioner "file" {
    source      = "apps/app2/" # when "/" at the end is added - CONTENTS of FOLDER WILL BE COPIED
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/file-copy.html /var/www/html"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.my-ec2-vm.tpivate_ip} >> create_time-private-ip.txt"
    working_dir = "local-exec-output-files/"
  }

    provisioner "local-exec" {
      when = destroy
    command = "echo destroy-time provisioner Instantce at `date` >> create_time-private-ip.txt"
    working_dir = "local-exec-output-files/"
  }
}


#File provisioners
