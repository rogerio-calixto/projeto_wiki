# resource "aws_alb" "lb-master" {
#   name                       = "lb-wiki"
#   security_groups            = [aws_security_group.sg-lb.id]
#   load_balancer_type         = "application"
#   internal                   = false
#   enable_deletion_protection = false
#   subnets                    = var.public-subnet-ids
#   depends_on = [
#     aws_security_group.sg-lb
#   ]
# }

# resource "aws_alb_target_group" "lb-tg-master" {
#   name        = "lb-tg-wiki"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"

#   vpc_id = var.aws_vpc_vpc_id

#   health_check {
#     healthy_threshold = 2
#     path              = "/"
#     matcher           = "200,302"
#   }

#   stickiness {
#     cookie_duration = 3600
#     enabled         = true
#     type            = "lb_cookie"
#   }
# }

# resource "aws_alb_listener" "lb-listener-master" {
#   default_action {
#     target_group_arn = aws_alb_target_group.lb-tg-master.arn
#     type             = "forward"
#   }

#   load_balancer_arn = aws_alb.lb-master.arn
#   port              = 80
#   protocol          = "HTTP"

#   depends_on = [aws_alb_target_group.lb-tg-master]
# }