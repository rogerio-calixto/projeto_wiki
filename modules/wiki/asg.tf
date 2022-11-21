# # data "template_file" "user_data" {
# #   template = file("scripts/install_wiki.sh")
# #   vars = {
# #     efs_dns_name  = "${aws_efs_file_system.wiki-efs.dns_name}"
# #     sns_topic_arn = var.sns_topic_arn
# #   }
# # }

# resource "aws_launch_configuration" "lc-wiki" {
#   name     = "${var.environment}-lc-wiki"
#   image_id = "ami-0aebfd4e021bdc3c6"
#   # image_id                    = lookup(var.amis, var.aws_region)
#   instance_type = var.instance_type
#   key_name      = var.key_name
#   # user_data                   = data.template_file.user_data.rendered
#   associate_public_ip_address = true
#   security_groups             = [aws_security_group.sg-ec2.id]

#   # EBS root
#   root_block_device {
#     volume_size = 8
#     volume_type = "gp2"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }

#   depends_on = [aws_security_group.sg-ec2, aws_efs_file_system.wiki-efs]
# }

# resource "aws_autoscaling_group" "asg-wiki" {
#   name                      = "${var.environment}-asg-wiki"
#   min_size                  = 0
#   max_size                  = 2
#   desired_capacity          = 1
#   force_delete              = true
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   launch_configuration      = aws_launch_configuration.lc-wiki.name
#   target_group_arns         = [aws_alb_target_group.lb-tg-master.arn]
#   # vpc_zone_identifier       = [(var.subnet_ids[0])]
#   vpc_zone_identifier = var.public-subnet-ids
#   lifecycle {
#     create_before_destroy = true
#   }

#   enabled_metrics = [
#     "GroupMinSize",
#     "GroupMaxSize",
#     "GroupDesiredCapacity",
#     "GroupInServiceInstances",
#     "GroupTotalInstances"
#   ]

#   tag {
#     key                 = "Name"
#     value               = "${var.environment}-asg-wiki"
#     propagate_at_launch = true
#   }
#   # depends_on = [aws_launch_configuration.lc-wiki, aws_alb.lb-master]
#   depends_on = [aws_launch_configuration.lc-wiki]
# }

# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = aws_autoscaling_group.asg-wiki.id
#   lb_target_group_arn    = aws_alb_target_group.lb-tg-master.arn

#   depends_on = [
#     aws_autoscaling_group.asg-wiki,
#     aws_alb_target_group.lb-tg-master
#   ]
# }

# resource "aws_placement_group" "pg-wiki" {
#   name     = "${var.environment}-pg-wiki"
#   strategy = "cluster"
# }