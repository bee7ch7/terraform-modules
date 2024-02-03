output "sns_arn" {
  description = "SNS topic arn"
  value       = aws_sns_topic.this[0].arn
}
