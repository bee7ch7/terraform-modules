# Lambda Function
output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = try(aws_lambda_function.this[0].arn, "")
}

output "lambda_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = try(aws_lambda_function.this[0].invoke_arn, "")
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = try(aws_lambda_function.this[0].function_name, "")
}

output "lambda_function_qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = try(aws_lambda_function.this[0].qualified_arn, "")
}

output "lambda_function_qualified_invoke_arn" {
  description = "The Invoke ARN identifying your Lambda Function Version"
  value       = try(aws_lambda_function.this[0].qualified_invoke_arn, "")
}

output "lambda_function_version" {
  description = "Latest published version of Lambda Function"
  value       = try(aws_lambda_function.this[0].version, "")
}

output "lambda_function_last_modified" {
  description = "The date Lambda Function resource was last modified"
  value       = try(aws_lambda_function.this[0].last_modified, "")
}

output "lambda_basic_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = try(aws_iam_role.basic_lambda_role[0].arn, "")
}

output "lambda_basic_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = try(aws_iam_role.basic_lambda_role[0].name, "")
}
