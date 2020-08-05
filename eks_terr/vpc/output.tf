output "aws_vpc" {
  value = aws_vpc.myvpc.*.id
}

output "aws_public_subnets" {
  value = aws_subnet.public_subnet.*.id
}

output "aws_private_subnets" {
  value = aws_subnet.private_subnet.*.id
}

output "aws_igw" {
  value = aws_internet_gateway.igw.id
}

output "aws_nat" {
  value = aws_nat_gateway.nat.id
}

output "aws_eip" {
  value = aws_eip.eip.id
}

output "aws_route_table_private" {
  value = aws_route_table.private.id
}

output "aws_route_table_public" {
  value = aws_route_table.public.id
}
