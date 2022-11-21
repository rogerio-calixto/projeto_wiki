resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "rt-pvt-wiki"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_route_table_association" "rt-association-private" {
  count          = var.subnet_counts
  route_table_id = aws_route_table.rt-private.id
  subnet_id      = aws_subnet.private-subnets.*.id[count.index]

  depends_on = [aws_subnet.public-subnets]
}

resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "rt-pub-wiki"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc, aws_internet_gateway.igw]
}

resource "aws_route_table_association" "rt-association-public" {
  count          = var.subnet_counts
  route_table_id = aws_route_table.rt-public.id
  subnet_id      = aws_subnet.public-subnets.*.id[count.index]

  depends_on = [aws_subnet.public-subnets]
}