resource "aws_db_instance" "db" {
  count = var.create ? 1 : 0

  allocated_storage = 20
  engine            = "mysql"
  instance_class    = var.instance_class

  username = var.db_username
  password = var.db_password

  skip_final_snapshot = true
}
