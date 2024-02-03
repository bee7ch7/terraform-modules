output "vpc_id" {
  value = aws_vpc.main.id
}
output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnets" {
  value = aws_subnet.public.*.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnets" {
  value = aws_subnet.private.*.cidr_block
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "db_subnets" {
  value = aws_subnet.db.*.cidr_block
}

output "db_subnet_ids" {
  value = aws_subnet.db.*.id
}

output "db_route_table_ids" {
  value = aws_route_table.db.*.id
}

output "public_route_table_ids" {
  value = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  value = aws_route_table.private.*.id
}

output "all_route_table_ids" {
  value = concat(aws_route_table.db.*.id, aws_route_table.public.*.id, aws_route_table.private.*.id)
}

output "all_subnet_ids" {
  value = concat(aws_subnet.db.*.id, aws_subnet.public.*.id, aws_subnet.private.*.id)
}

output "default_security_group_id" {
  value = aws_vpc.main.default_security_group_id
}

output "private_availability_zones" {
  value = aws_subnet.private.*.availability_zone
}

output "public_availability_zones" {
  value = aws_subnet.public.*.availability_zone
}

output "db_availability_zones" {
  value = aws_subnet.db.*.availability_zone
}
