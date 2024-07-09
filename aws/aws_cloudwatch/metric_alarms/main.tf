resource "aws_cloudwatch_metric_alarm" "this" {
  count = var.create ? 1 : 0

  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  datapoints_to_alarm = var.datapoints_to_alarm
  period              = var.period
  metric_name         = var.metric_name
  namespace           = var.namespace
  statistic           = var.statistic
  threshold           = var.threshold
  treat_missing_data  = var.treat_missing_data

  alarm_description = var.alarm_description
  alarm_actions     = var.alarm_actions
  ok_actions        = var.ok_actions

  dimensions = var.dimensions

  dynamic "metric_query" {
    for_each = var.metric_queries
    content {
      id          = lookup(metric_queries.value, "id")
      account_id  = lookup(metric_queries.value, "account_id", null)
      label       = lookup(metric_queries.value, "label", null)
      return_data = lookup(metric_queries.value, "return_data", null)
      expression  = lookup(metric_queries.value, "expression", null)
      period      = lookup(metric_queries.value, "period", null)

      dynamic "metric" {
        for_each = lookup(metric_queries.value, "metric", [])
        content {
          metric_name = lookup(metric.value, "metric_name")
          namespace   = lookup(metric.value, "namespace")
          period      = lookup(metric.value, "period")
          stat        = lookup(metric.value, "stat")
          unit        = lookup(metric.value, "unit", null)
          dimensions  = lookup(metric.value, "dimensions", null)
        }
      }
    }
  }

  tags = var.tags
}
