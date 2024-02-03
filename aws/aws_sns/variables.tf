variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "create" {
  description = "Create resource or not"
  type        = bool
  default     = true
}

variable "name" {
  description = "SNS topic name"
  type        = string
  default     = "default-sns"
}

variable "subscribers" {
  description = "Subscribers map"
  type        = list(string)
  default     = []
}

variable "protocol" {
  description = "SNS topic protocol"
  type        = string
  default     = "email"
}
