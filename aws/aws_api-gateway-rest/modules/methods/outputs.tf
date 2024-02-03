output "methods" {
  value       = aws_api_gateway_method.this
  description = "description"
}

output "integrations" {
  value       = aws_api_gateway_integration.this
  description = "description"
}
