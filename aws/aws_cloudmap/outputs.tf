output "private_dns_namespace_id" {
  value       = try(aws_service_discovery_private_dns_namespace.this[0].id, null)
  description = "Private DNS namespace ID"
}

output "service_discovery_service_ids" {
  value       = { for k, v in aws_service_discovery_service.this : k => v.id }
  description = "Private services IDs"
}

output "service_discovery_service_arns" {
  value       = { for k, v in aws_service_discovery_service.this : k => v.arn }
  description = "Private services ARNs"
}
