# Create PDS MySQL DB

resource "aws_db_instance" "db01" {
  allocated_storage = 5
  engine = "mysql"
  instance_class = "db.t2.micro"
  name = "mydb01"
  username = var.db_username
  password = var.db_pswd
  skip_final_snapshot = true
}