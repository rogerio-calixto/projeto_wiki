# resource "aws_db_subnet_group" "default" {
#   name       = "wiki-db-group"
#   subnet_ids = var.private-subnet-ids
#   tags = {
#     Name = "mysql-wiki"
#     Project     = var.project
#     Environment = var.environment
#   }
# }

# /*
# resource "random_password" "db_password" {
#   length           = 20
#   special          = true
#   override_special = "_"
# }
# */

# resource "aws_db_instance" "this" {
#   allocated_storage    = 20
#   storage_type         = "gp2"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   identifier           = "database-wiki"
#   instance_class       = var.db_instance_type
#   db_name              = "wiki_db"
#   username             = "admin"
#   password             = "senha1234"
#   parameter_group_name = "default.mysql5.7"
#   availability_zone    = "${var.avaiable_zones_name[0]}"
#   skip_final_snapshot  = true

#   db_subnet_group_name   = aws_db_subnet_group.default.id
#   vpc_security_group_ids = [
#     aws_security_group.sg-rds.id]

#   tags = {
#     Name        = "rds-wiki"
#     Project     = var.project
#     Environment = var.environment
#   }
# }