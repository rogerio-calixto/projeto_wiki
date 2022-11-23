data "aws_availability_zones" "available" {}
resource "aws_subnet" "private-subnets" {
  count             = var.subnet_counts
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.${count.index + 1}.0/24"
  tags = {
    Name        = "${var.project}-subnet-private-${count.index + 1}"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "public-subnets" {
  count                   = var.subnet_counts
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.${count.index + 3}.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project}-subnet-public-${count.index + 1}"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc]
}