variable "api_id" {
  type        = string
  description = "description"
}

variable "api_name" {
  type        = string
  description = "description"
}

variable "methods" {
  type        = any
  description = "description"
}

variable "request_validators" {
  type        = map(any)
  default     = {}
  description = "Map with request validators"
}

variable "authorizers" {
  type        = list(string)
  default     = []
  description = "List of authorizers from data api gateway"
}
