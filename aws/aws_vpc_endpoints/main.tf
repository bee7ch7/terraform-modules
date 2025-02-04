# resource "aws_vpc_endpoint" "this" {

#   private_dns_enabled = true
#   security_group_ids  = var.security_group_ids
#   service_name        = "com.amazonaws.us-east-2.execute-api"
#   subnet_ids          = var.subnet_ids
#   vpc_endpoint_type   = "Interface"
#   vpc_id              = var.vpc_id

# }

# locals {
#   endpoints = var.create ? var.endpoints : tomap({})
# }

################################################################################
# Endpoint(s)
################################################################################

data "aws_vpc_endpoint_service" "this" {
  for_each = var.endpoints

  service      = lookup(each.value, "service", null)
  service_name = lookup(each.value, "service_name", null)

  filter {
    name   = "service-type"
    values = [lookup(each.value, "service_type", "Interface")]
  }
}

resource "aws_vpc_endpoint" "this" {
  for_each = var.endpoints

  vpc_id            = var.vpc_id
  service_name      = data.aws_vpc_endpoint_service.this[each.key].service_name
  vpc_endpoint_type = lookup(each.value, "service_type", "Interface")
  auto_accept       = lookup(each.value, "auto_accept", null)

  security_group_ids  = lookup(each.value, "service_type", "Interface") == "Interface" ? distinct(concat(var.security_group_ids, lookup(each.value, "security_group_ids", []))) : null
  subnet_ids          = lookup(each.value, "service_type", "Interface") == "Interface" ? distinct(concat(var.subnet_ids, lookup(each.value, "subnet_ids", []))) : null
  route_table_ids     = lookup(each.value, "service_type", "Interface") == "Gateway" ? lookup(each.value, "route_table_ids", null) : null
  policy              = lookup(each.value, "policy", null)
  private_dns_enabled = lookup(each.value, "service_type", "Interface") == "Interface" ? lookup(each.value, "private_dns_enabled", null) : null

  tags = {
    Name        = "${each.key}-endpoint-${var.environment}"
    Environment = var.environment
  }

  timeouts {
    create = lookup(var.timeouts, "create", "10m")
    update = lookup(var.timeouts, "update", "10m")
    delete = lookup(var.timeouts, "delete", "10m")
  }
}

resource "aws_ec2_instance_connect_endpoint" "this" {
  for_each = length(var.ec2_instance_connect_endpoints) > 0 ? var.ec2_instance_connect_endpoints : {}

  subnet_id          = each.value.subnet_id
  security_group_ids = try(each.value.security_group_ids, null)
  preserve_client_ip = try(each.value.preserve_client_ip, true)

  tags = merge(
    {
      Name        = "${each.key}-ec2-instance-connect-endpoint-${var.environment}"
      Environment = var.environment
    },
    try(each.value.ec2_instance_connect_endpoint_tags, {})
  )
}
