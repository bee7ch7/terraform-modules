variable "create_model" {
  type        = bool
  default     = true
  description = "Create model resource or not"
}

variable "name" {
  type        = string
  default     = ""
  description = "Model name"
}

variable "enable_network_isolation" {
  type        = bool
  default     = false
  description = "Enable network isolation"
}

variable "execution_role_arn" {
  type        = string
  default     = null
  description = "Model executiob role ARN"
}

variable "primary_container" {
  type        = map(any)
  default     = {}
  description = "Primary container specification"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags"
}

variable "model_tags" {
  type        = map(any)
  default     = {}
  description = "Model tags"
}

variable "trusted_role_services" {
  type        = list(any)
  default     = ["sagemaker.amazonaws.com"]
  description = "List of trusted services"
}

variable "policies_arns" {
  type        = list(any)
  default     = []
  description = "List of policies ARNs"
}
