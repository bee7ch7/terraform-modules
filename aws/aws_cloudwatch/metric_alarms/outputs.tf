output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = { for k, v in aws_cloudwatch_metric_alarm.this : k => v.arn }
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = { for k, v in aws_cloudwatch_metric_alarm.this : k => v.id }
}