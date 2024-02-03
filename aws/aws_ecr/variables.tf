variable "name" {
  type        = string
  description = "Name of repository"
}

variable "environment" {
  type        = string
  description = "the name of your environment, e.g. \"prod\""
}

variable "attach_lifecycle_policy" {
  type    = bool
  default = false
}

variable "policy" {
  type        = string
  description = "Policy"
  default     = ""
}
