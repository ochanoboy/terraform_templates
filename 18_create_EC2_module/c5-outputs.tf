# Define Output Values

# Attribute Reference
output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value = module.ec2_instance.*.public_ip
}


# Attribute Reference - Create Public DNS URL
output "ec2_publicdns" {
  description = "Public DNS URL of an EC2 Instance"
  value = module.ec2_cluster.*.public_dns
}
