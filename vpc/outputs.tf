output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_subnet_ids" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "private_subnet_ids" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "public_route_table_ids" {
  value = "${join(",", aws_route_table.public.*.id)}"
}

output "private_route_table_ids" {
  value = "${join(",", aws_route_table.private.*.id)}"
}
