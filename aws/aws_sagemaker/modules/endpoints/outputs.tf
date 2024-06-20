output "endpoint_arn" {
  value       = try(aws_sagemaker_endpoint.this[0].arn, "")
  description = "Endpoint ARN"
}

output "endpoint_name" {
  value       = try(aws_sagemaker_endpoint.this[0].name, "")
  description = "Endpoint name"
}

output "endpoint_configuration_arn" {
  value       = try(aws_sagemaker_endpoint_configuration.this[0].arn, "")
  description = "Endpoint configuration ARN"
}

output "endpoint_configuration_name" {
  value       = try(aws_sagemaker_endpoint_configuration.this[0].name, "")
  description = "Endpoint configuration name"
}
