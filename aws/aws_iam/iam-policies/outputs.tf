output "policy_id" {
  value       = { for k, v in aws_iam_policy.this : k => v.id }
  description = "Description"
}

output "policy_arn" {
  value       = { for k, v in aws_iam_policy.this : k => v.arn }
  description = "Description"
}

output "list_of_policy_arns" {
  value       = [for k, v in aws_iam_policy.this : v.arn]
  description = "Description"
}

output "policy_name" {
  value       = { for k, v in aws_iam_policy.this : k => v.name }
  description = "Description"
}
