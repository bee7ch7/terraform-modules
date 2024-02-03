output "api_id" {
  value       = aws_api_gateway_rest_api.this[0].id
  description = "description"
}

output "api_arn" {
  value       = aws_api_gateway_rest_api.this[0].arn
  description = "description"
}

output "api_execution_arn" {
  value       = aws_api_gateway_rest_api.this[0].execution_arn
  description = "description"
}

# output "resources_level_1" {
#   value = { for k, v in module.level_1.resources : v.path_part => {
#     id        = v.id
#     parent_id = v.parent_id
#     path      = v.path
#     }
#   }
#   description = "description"
# }

# output "resources_level_1_map" {
#   value       = try(module.level_1.resources_map, {})
#   description = "description"
# }

output "resources_level_2" {
  value = { for k, v in module.level_2.resources : v.path_part => {
    id        = v.id
    parent_id = v.parent_id
    path      = v.path
    }
  }
  description = "description"
}

output "resources_level_2_map" {
  value       = try(module.level_2.resources_map, {})
  description = "description"
}

output "methods" {
  value       = module.methods
  description = "description"
}

output "request_validators" {
  value       = aws_api_gateway_request_validator.this
  description = "description"
}

output "request_models" {
  value       = aws_api_gateway_model.this
  description = "description"
}

output "api_gateway_domain_name" {
  value       = aws_api_gateway_domain_name.this
  description = "description"
  sensitive   = true
}

output "lambda_authorizer_arn" {
  value       = try(aws_api_gateway_authorizer.lambda[0].arn, "")
  description = "ARN of lambda authorizer"
}

output "lambda_authorizer_id" {
  value       = try(aws_api_gateway_authorizer.lambda[0].id, "")
  description = "ID of lambda authorizer"
}

output "lambda_authorizer_invocation_role" {
  value       = try(aws_iam_role.authorizer_invocation_role[0].arn, "")
  description = "Lambda invocation role to allow API Gateway to invoke it"
}

output "lambda_authorizer_invocation_policy" {
  value       = try(aws_iam_role_policy.authorizer_invocation_policy[0], "")
  description = "Lambda invocation policy"
}

output "api_keys" {
  value       = try(aws_api_gateway_api_key.api_key, "")
  description = "Lambda invocation policy"
  sensitive   = true
}
# { for k, v in aws_api_gateway_domain_name.this : k => v.domain_name }
output "custom_domain" {
  value = { for k, v in aws_api_gateway_domain_name.this : k => {
    name                 = v.domain_name
    regional_certificate = v.regional_certificate_arn
    }
  }
  description = "Custom domain configuration"
}

output "cognito_authorizers" {
  value = { for k, v in aws_api_gateway_authorizer.cognito : k => {
    id  = v.id
    arn = v.arn
    }
  }
  description = "Map with cognito authorizers"
}

output "route53_records" {
  value = { for k, v in aws_route53_record.this : k => {
    name    = v.name
    records = v.records
    zone_id = v.zone_id
    alias   = v.alias
    }
  }
  description = "DNS records for custom domain"
}

# output "resources_level_2" {
#   value = { for k, v in module.level_2.resources : v.path_part => {
#     id        = v.id
#     parent_id = v.parent_id
#     path      = v.path
#     }
#   }
#   description = "description"
# }
