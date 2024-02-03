variable "create_resources" {
  type        = bool
  default     = true
  description = "description"
}

variable "api_id" {
  type        = string
  description = "description"
}

variable "parent_id" {
  type        = string
  description = "description"
}

variable "resources" {
  type        = map(any)
  default     = {}
  description = "description"
}
