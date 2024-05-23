# Input variables
variable "bucket_name" {
  description = "Name of S3 bucket"
  type = string
}

variable "tags" {
  description = "Tages to set of bucket"
  type = map(string)
  default = {}
}
