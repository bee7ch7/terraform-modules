variable "parameters" {
  description = "Map with parameter settings"
  type        = map(any)
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags for the resource"
}
