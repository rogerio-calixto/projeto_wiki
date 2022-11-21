output "private-subnet-ids" {
  description = "List ID from private subnets created"
  value       = module.vpc.private-subnet-ids
}
output "public-subnet-ids" {
  description = "List ID from public subnets created"
  value       = module.vpc.public-subnet-ids
}

output "lb-master-dns_names" {
  description = "DNS_Name Load Balancer from EC2-Master"
  value       = module.glpi.lb-master-dns_names
}

# output "ec2_dns" {
#   value = module.glpi.ec2_dns
# }

# output "sns_topic_arn" {
#   value = aws_sns_topic.futura-events.arn
# }

output "efs_dns_name" {
  value = module.glpi.efs_dns_name
}

output "avaiable_zones_name" {
  value = module.vpc.avaiable_zones_name
}
