
# output "efs-id" {
#   value = aws_efs_file_system.wiki-efs.id
# }

# output "lb-master-dns_names" {
#   value = aws_alb.lb-master.dns_name
# }

# # output "aws_security_group_sg-lb_id" {
# #   value = aws_security_group.sg-lb.id
# # }

output "aws_security_group_sg-ec2_id" {
  value = aws_security_group.sg-ec2.id
}

output "public_ip" {
  value = aws_instance.wiki-ec2.public_ip
}

# output "efs_dns_name" {
#   value = aws_efs_file_system.wiki-efs.dns_name
# }