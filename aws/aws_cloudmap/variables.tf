variable "create_private_dns_namespace" {
  type        = bool
  default     = true
  description = "Whether to create private dns namespace"
}
variable "create_service_discovery_sevices" {
  type        = bool
  default     = true
  description = "Whether to create services for private dns namespace"
}

variable "private_dns_namespace_name" {
  type        = string
  default     = "app.internal"
  description = "Namespace name"
}

variable "private_dns_namespace_description" {
  type        = string
  default     = "Description"
  description = "Namespace description"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "AWS VPC id"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags for the resource"
}

variable "service_discovery_sevices" {
  type = map(object({
    dns_config = object({
      routing_policy = optional(string, "MULTIVALUE")
      dns_ttl        = number
      dns_type       = string
    })

    health_check_config = optional(object({
      failure_threshold = optional(number, null)
      resource_path     = optional(string, null)
      type              = optional(string, null)
    }), {})

    health_check_custom_config = optional(object({
      failure_threshold = optional(number, null)
    }), {})

  }))
  default     = {}
  description = "Map with service configuration"
}

