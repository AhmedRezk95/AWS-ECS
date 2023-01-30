
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [module.network.subnet_id_p1,module.network.subnet_id_p2]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  db_name           = "mydb"

  # JUST FOR THE DEMO WE HARDCODED USERNAME AND PASSWORD
  username = "admin"
  password = "admin12345678"
  ######################################################
  publicly_accessible  = true
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  # set db subnet group name
  db_subnet_group_name = aws_db_subnet_group.default.name
  # set security group from securitygroup.tf
  vpc_security_group_ids = [aws_security_group.ecs_sg.id, aws_security_group.rds_sg.id]
  # set database port
  port = 3306
}
