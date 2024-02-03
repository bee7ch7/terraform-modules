resource "aws_sns_topic" "this" {
  count = var.create ? 1 : 0

  name = var.name
  tags = var.tags
}

resource "aws_sns_topic_subscription" "this" {
  for_each = toset(var.subscribers)

  topic_arn = aws_sns_topic.this[0].arn
  protocol  = var.protocol
  endpoint  = each.value
}
