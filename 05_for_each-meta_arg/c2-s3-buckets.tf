#Create S3 bucket
resource "aws_s3_bucket" "s3_bucket_aws" {
  # For_each Meta-Argument
  for_each = {
    "dev"     =  "my-dev-bucket"
    "prod"    =  "my-prod-bucket"
    "preprod" =  "my-preprod-bucket"
    "test"    =  "my-test-bucket"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    Name        = "${each.value}"
    Environment = "${each.key}"
  }
}


#Create IAM users
resource "aws_iam_user" "kaspi_user" {
  # For_each Meta-Argument
  for_each = toset(["kaspi_borisov", "axenic_azarov", "developteam_mauer"])
  name = each.key
}