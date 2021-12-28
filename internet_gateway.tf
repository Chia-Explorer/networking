resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "public" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  gateway_id             = aws_internet_gateway.public.id
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"

  timeouts {
    create = "5m"
  }
}
