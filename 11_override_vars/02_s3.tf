
# Create random pet name
resource "random_pet" "petname" {
  length = 5
  separator = "_"
}

# Create AWS Bucket AWS
resource "aws_s3_bucket" "sample_01" {
  bucket = random_pet.petname.id
  acl = "public-read"
#  region = "us-west_1"
}
