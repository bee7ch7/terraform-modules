variable "create_endpoint" {
  type        = bool
  default     = true
  description = "Create endpoint resource or not"
}

variable "create_endpoint_configuration" {
  type        = bool
  default     = true
  description = "Create endpoint configuration resource or not"
}

variable "endpoint_name" {
  type        = string
  default     = ""
  description = "Endpoint name"
}

variable "endpoint_config_name" {
  type        = string
  default     = ""
  description = "Endpoint config name"
}

variable "production_variants" {
  type        = any
  default     = {}
  description = "Production variats specification"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags"
}
