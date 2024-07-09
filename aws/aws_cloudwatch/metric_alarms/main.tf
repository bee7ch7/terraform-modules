resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = { for index, value in var.alert_settings : value.dimensions.path => value }

  alarm_name          = "${local.environment}-job-${each.key}-count-4xx"
  comparison_operator = each.value.comparison_operator
  evaluation_periods  = each.value.evaluation_periods
  datapoints_to_alarm = each.value.datapoints_to_alarm
  period              = each.value.period
  metric_name         = each.value.dimensions.metric_name
  namespace           = each.value.namespace
  statistic           = each.value.statistic
  threshold           = each.value.threshold
  treat_missing_data  = each.value.treat_missing_data

  alarm_description = "Trigger an alert when the count of 4xx errors on ${each.key} breaches threshold"
  alarm_actions     = each.value.alarm_actions
  ok_actions        = each.value.ok_actions

  dimensions = each.value.dimensions

  dynamic "metric_query" {
    for_each = each.value.metric_queries
    content {
      id          = lookup(metric_query.value, "id")
      account_id  = lookup(metric_query.value, "account_id", null)
      label       = lookup(metric_query.value, "label", null)
      return_data = lookup(metric_query.value, "return_data", null)
      expression  = lookup(metric_query.value, "expression", null)
      period      = lookup(metric_query.value, "period", null)

      dynamic "metric" {
        for_each = lookup(metric_query.value, "metric", [])
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
