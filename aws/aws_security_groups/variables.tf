variable "create" {
  type    = bool
  default = true
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "name" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable "ports_in" {
  type = list(any)
}

variable "ports_out" {
  type = map(any)
}
