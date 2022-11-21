

# resource "aws_efs_file_system" "wiki-efs" {
#   creation_token   = "efs-wiki"
#   performance_mode = "generalPurpose"
#   throughput_mode  = "bursting"
#   encrypted        = "true"
#   tags = {
#     Name        = "efs-wiki"
#     Project     = var.project
#     Environment = var.environment
#   }
#   lifecycle_policy {
#     transition_to_ia = "AFTER_30_DAYS"
#   }
#   lifecycle_policy {
#     transition_to_primary_storage_class = "AFTER_1_ACCESS"
#   }
# }
# resource "aws_efs_mount_target" "wiki-efs-mount" {
#   count           = length(var.private-subnet-ids)
#   file_system_id  = aws_efs_file_system.wiki-efs.id
#   subnet_id       = var.private-subnet-ids[count.index]
#   security_groups = ["${aws_security_group.sg-efs.id}"]
# }

# resource "aws_efs_access_point" "efs-data" {
#   file_system_id = aws_efs_file_system.wiki-efs.id
#   root_directory {
#     path = "/"
#   }
# }