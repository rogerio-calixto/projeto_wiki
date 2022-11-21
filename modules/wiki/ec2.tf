# # data "template_file" "user_data" {
# #   template = file("scripts/installing_wiki.sh")
# #   vars = {
# #     efs_dns_name  = "${aws_efs_file_system.wiki-efs.dns_name}"
# #     sns_topic_arn = var.sns_topic_arn
# #   }
# # }

resource "aws_instance" "wiki-ec2" {
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  subnet_id                   = var.public-subnet-ids[0]
  vpc_security_group_ids      = [aws_security_group.sg-ec2.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
#   user_data                   = data.template_file.user_data.rendered
  tags = {
    Name        = "ec2-wiki"
    Project     = var.project
    Environment = var.environment
  }

  # EBS root
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

#   depends_on = [aws_security_group.sg-ec2, aws_efs_file_system.wiki-efs]
  depends_on = [aws_security_group.sg-ec2]
}