output "alias" {
  value       = ec_deployment.this[0].alias
  description = "Elasticsearch stack alias"
}

output "ec_version" {
  value       = ec_deployment.this[0].version
  description = "Elasticsearch stack alias"
}

output "cloud_id" {
  value       = ec_deployment.this[0].elasticsearch.cloud_id
  description = "Elasticsearch stack cloud id"
}

output "stack_name" {
  value       = ec_deployment.this[0].name
  description = "Elasticsearch stack alias"
}

output "region" {
  value       = ec_deployment.this[0].region
  description = "Elasticsearch stack deployment region"
}

output "elasticsearch_endpoints" {
  value = {
    http  = try(ec_deployment.this[0].elasticsearch.http_endpoint, "")
    https = try(ec_deployment.this[0].elasticsearch.https_endpoint, "")
  }
  description = "Elasticsearch endpoints"
}

output "elasticsearch_credentials" {
  value = {
    username = try(ec_deployment.this[0].elasticsearch_username, "")
    password = try(ec_deployment.this[0].elasticsearch_password, "")
  }
  description = "Elasticsearch credentials"
  sensitive   = true
}

output "integration_server_endpoints" {
  value = merge(
    {
      http  = try(ec_deployment.this[0].integrations_server.http_endpoint, "")
      https = try(ec_deployment.this[0].integrations_server.https_endpoint, "")
    },
    try(ec_deployment.this[0].integrations_server.endpoints)
  )
  description = "Integration server endpoints"
}

output "kibana_endpoints" {
  value = {
    http  = try(ec_deployment.this[0].kibana.http_endpoint, "")
    https = try(ec_deployment.this[0].kibana.https_endpoint, "")
  }
  description = "Kibana endpoints"
}

output "ssm_parameter_names" {
  value = {
    username   = try(aws_ssm_parameter.username[0].name, "")
    password   = try(aws_ssm_parameter.password[0].name, "")
    ec_api_key = try(var.api_key_ssm_name, "")
  }
  description = "Kibana endpoints"
}

output "apm_secret_token" {
  value       = try(ec_deployment.this[0].apm_secret_token)
  description = "APM secret token"
}
