resource "aws_service_discovery_private_dns_namespace" "this" {
  count = var.create_private_dns_namespace ? 1 : 0

  name        = var.private_dns_namespace_name
  description = var.private_dns_namespace_description
  vpc         = var.vpc_id
  tags        = var.tags
}

resource "aws_service_discovery_service" "this" {
  for_each = { for k, v in var.service_discovery_sevices : k => v if var.create_service_discovery_sevices }
  name     = each.key

  dynamic "dns_config" {
    for_each = length(each.value.dns_config) > 0 ? [1] : []
    content {
      namespace_id = aws_service_discovery_private_dns_namespace.this[0].id
      dns_records {
        ttl  = each.value.dns_config.dns_ttl
        type = each.value.dns_config.dns_type
      }
      routing_policy = each.value.dns_config.routing_policy
    }
  }

  dynamic "health_check_config" {
    for_each = length(each.value.health_check_config) > 0 ? [1] : []
    content {
      failure_threshold = each.value.health_check_config.failure_threshold
      resource_path     = each.value.health_check_config.resource_path
      type              = each.value.health_check_config.type
    }
  }

  # dynamic "health_check_custom_config" {
  #   for_each = length(each.value.health_check_custom_config) > 0 ? [1] : []
  #   content {
  #     failure_threshold = each.value.health_check_custom_config.failure_threshold
  #   }
  # }

  tags = var.tags
}
