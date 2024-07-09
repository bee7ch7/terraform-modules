variable "alert_settings" {
  description = "List of job alerts for 4xx status code"
  type = list(object({
    dimensions = object({
      path        = string
      api         = string
      metric_name = string
      status_code = string
    })

    threshold           = number
    alarm_actions       = list(string)
    ok_actions          = list(string)
    comparison_operator = string
    treat_missing_data  = string
    datapoints_to_alarm = number
    evaluation_periods  = number
    statistic           = string
    period              = number
  }))
}
