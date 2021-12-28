resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id = aws_vpc.this.id

  availability_zone = var.private_subnets[count.index].availability_zone
  cidr_block        = var.private_subnets[count.index].cidr_block
}
