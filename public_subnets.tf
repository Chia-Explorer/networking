resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id = aws_vpc.this.id

  availability_zone = var.public_subnets[count.index].availability_zone
  cidr_block        = var.public_subnets[count.index].cidr_block
}

resource "aws_eip" "public" {
  count = length(var.public_subnets)

  vpc = true
}

resource "aws_nat_gateway" "public" {
  count = length(var.public_subnets)

  allocation_id = aws_eip.public[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  depends_on = [aws_internet_gateway.public]
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[count.index].id
}
