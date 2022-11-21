
output "aws_vpc_vpc_id" {
  value = aws_vpc.vpc.id
}

output "private-subnet-ids" {
  value = aws_subnet.private-subnets[*].id
}

output "public-subnet-ids" {
  value = aws_subnet.public-subnets[*].id
}

output "avaiable_zones_name" {
  value = data.aws_availability_zones.available.names
}