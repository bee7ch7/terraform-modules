variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = ""
}

variable "root_domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = null
}

variable "subject_alternative_names" {
  description = "SAN names for the certificate"
  type        = list(any)
  default     = []
}

variable "create_route53_records" {
  description = "When validation is set to DNS, define whether to create the DNS records internally via Route53 or externally using any DNS provider"
  type        = bool
  default     = true
}

variable "wait_for_validation" {
  description = "Whether to wait for the validation to complete"
  type        = bool
  default     = true
}
