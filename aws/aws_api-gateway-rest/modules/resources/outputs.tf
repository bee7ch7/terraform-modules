output "resources" {
  value       = aws_api_gateway_resource.this
  description = "description"
}

output "resources_map" {
  value = { for k, v in aws_api_gateway_resource.this : trim(v.path_part, "{}+") => {
    id        = v.id
    parent_id = v.parent_id
    path      = v.path
    }
  }
  description = "description"
}
