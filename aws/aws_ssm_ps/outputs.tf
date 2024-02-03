output "ssm_parameter_arns" {
  value       = { for k, v in aws_ssm_parameter.this : k => v.arn }
  description = "List of SSM parameter arns"
}

output "ssm_parameter_values" {
  value       = { for k, v in aws_ssm_parameter.this : k => v.value }
  sensitive   = true
  description = "List of SSM parameter values"
}
