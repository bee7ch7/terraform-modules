variable "create" {
  description = "Whether to create the Cloudwatch metric alarm"
  type        = bool
  default     = true
}

variable "dimensions" {
  description = "Dimensions for the alert"
  type        = any
}

variable "alarm_name" {
  type        = string
  description = "Alarm name"
}

variable "alarm_description" {
  type        = string
  description = "Alarm description"
  default     = null
}

variable "metric_name" {
  type        = string
  description = "The name for the alarm's associated metric"
  default     = null
}

variable "namespace" {
  type        = string
  description = "The namespace for the alarm"
  default     = null
}

variable "threshold" {
  type        = string
  description = "Value against specified statistic is compared"
  default     = ""
}

variable "alarm_actions" {
  type        = list(string)
  description = "List of actions when alarm transitions to ALARM"
  default     = null
}

variable "ok_actions" {
  type        = list(string)
  description = "List of actions when alarm transitions to OK"
  default     = null
}

variable "comparison_operator" {
  type        = string
  description = "Supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold"
}

variable "treat_missing_data" {
  type        = string
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching."
  default     = "missing"
}

variable "unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
  default     = null
}

variable "datapoints_to_alarm" {
  type        = number
  description = "The number of datapoints that must be breaching to trigger the alarm"
  default     = null
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = null
}

variable "period" {
  type        = string
  description = "The period in seconds over which the specified statistic is applied."
  default     = null
}

variable "metric_queries" {
  type        = any
  description = "Enables you to create an alarm based on a metric math expression. You may specify at most 20."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources"
  default     = {}
}