# resource "aws_security_group" "sg-lb" {
#   name        = "${var.environment}-sg-lb-wiki"
#   description = "Habilita acesso HTTP"
#   vpc_id      = var.aws_vpc_vpc_id
#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name        = "${var.environment}-sg-lb-wiki"
#     Project     = var.project
#     Environment = var.environment
#   }
# }

resource "aws_security_group" "sg-ec2" {
  name        = "sg-${var.environment}-web"
  description = "Grupo de seguranca projeto 7 web"
  vpc_id      = var.aws_vpc_vpc_id

  ingress {
    description = "SSH para IP especifico"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.internal_ip_ssh}"]
  }
  
  ingress {
    description     = "Porta alternativa HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    //security_groups = ["${aws_security_group.sg-lb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-${var.environment}-web"
    Project     = var.project
    Environment = var.environment
  }

  # depends_on = [aws_security_group.sg-lb]
}

# resource "aws_security_group" "sg-efs" {
#   name        = "${var.environment}-sg-efs-wiki"
#   description = "Habilita entrada ao sg-ec2"
#   vpc_id      = var.aws_vpc_vpc_id

#   ingress {
#     description     = "Porta especifica"
#     from_port       = 2049
#     to_port         = 2049
#     protocol        = "tcp"
#     security_groups = ["${aws_security_group.sg-ec2.id}"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name        = "${var.environment}-sg-efs-wiki"
#     Project     = var.project
#     Environment = var.environment
#   }

#   depends_on = [aws_security_group.sg-ec2]
# } 

# resource "aws_security_group" "sg-rds" {
#   name        = "${var.environment}-sg-rds-wiki"
#   description = "Habilita entrada ao sg-ec2"
#   vpc_id      = var.aws_vpc_vpc_id

#   ingress {
#     description     = "Porta especifica"
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tcp"
#     security_groups = ["${aws_security_group.sg-ec2.id}"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name        = "${var.environment}-sg-rds-wiki"
#     Project     = var.project
#     Environment = var.environment
#   }

#   depends_on = [aws_security_group.sg-ec2]
# }
