resource "aws_db_instance" "db" {
  engine            = "mysql"
  allocated_storage = 20
  instance_class    = "db.t3.micro"
  multi_az         = true
  db_name          = var.db_name
  username         = var.db_user
  password         = var.db_pass
  publicly_accessible = false
}
