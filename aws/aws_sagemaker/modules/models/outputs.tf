output "model_arn" {
  value       = try(aws_sagemaker_model.this[0].arn, "")
  description = "Model ARN"
}

output "model_name" {
  value       = try(aws_sagemaker_model.this[0].name, "")
  description = "Model ARN"
}

output "model_execution_role_name" {
  value       = try(module.execution_role[0].iam_role_name, "")
  description = "Model ARN"
}

output "model_execution_role_arn" {
  value       = try(module.execution_role[0].iam_role_arn, "")
  description = "Model ARN"
}
