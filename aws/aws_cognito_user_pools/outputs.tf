output "congito_user_pool_id" {
  value       = try(aws_cognito_user_pool.this[0].id, "")
  description = "Cognito user pool id"
}

output "congito_user_pool_arn" {
  value       = try(aws_cognito_user_pool.this[0].arn, "")
  description = "Cognito user pool id"
}

output "congito_user_pool_name" {
  value       = try(aws_cognito_user_pool.this[0].name, "")
  description = "Cognito user pool id"
}

output "congito_user_pool_domain" {
  value       = try(aws_cognito_user_pool.this[0].domain, "")
  description = "Cognito user pool id"
}

output "congito_user_pool_custom_domain" {
  value       = try(aws_cognito_user_pool.this[0].custom_domain, "")
  description = "Cognito user pool id"
}

output "congito_user_pool_endpoint" {
  value       = try(aws_cognito_user_pool.this[0].endpoint, "")
  description = "Cognito user pool id"
}

output "cognito_user_clients" {
  value = { for k, v in aws_cognito_user_pool_client.this : k => {
    name                         = v.name
    logout_urls                  = v.logout_urls
    supported_identity_providers = v.supported_identity_providers
    callback_urls                = v.callback_urls
    allowed_oauth_flows          = v.allowed_oauth_flows
    allowed_oauth_scopes         = v.allowed_oauth_scopes
    }
  }
  description = "Cognito user pool clients"
}

output "cognito_idps" {
  value = { for k, v in aws_cognito_identity_provider.this : k => {
    id            = v.id
    provider_name = v.provider_name
    provider_type = v.provider_type
    }
  }
  description = "Cognito identity providers"
}

output "route_53" {
  value = { for k, v in aws_route53_record.this : k => {
    id      = v.id
    fqdn    = v.fqdn
    name    = v.name
    type    = v.type
    zone_id = v.zone_id
    alias   = v.alias
    }
  }
  description = "Route53 configuration"
}
