output "domain_id" {
  value       = try(aws_sagemaker_domain.this[0].id, "")
  description = "Sagemaker domain ID"
}

output "domain_arn" {
  value       = try(aws_sagemaker_domain.this[0].arn, "")
  description = "Sagemaker domain name"
}

output "default_execution_role_name" {
  value       = try(aws_iam_role.default[0].name, "")
  description = "Default execution role name"
}

output "default_execution_role_arn" {
  value       = try(aws_iam_role.default[0].arn, "")
  description = "Default execution role ARN"
}

output "user_profile_arns" {
  value       = { for k, v in try(aws_sagemaker_user_profile.this, {}) : k => v.arn }
  description = "User profile ARNs"
}

output "user_profile_ids" {
  value       = { for k, v in aws_sagemaker_user_profile.this : k => v.id }
  description = "User profile IDs"
}

output "user_profile_execution_role_arns" {
  value       = { for k, v in module.user_profile_execution_role : k => v.iam_role_arn }
  description = "User profile execution role ARNs"
}

output "user_profile_execution_role_names" {
  value       = { for k, v in module.user_profile_execution_role : k => v.iam_role_name }
  description = "User profile execution role IDs"
}