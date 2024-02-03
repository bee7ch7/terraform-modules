variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/8"
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(any)
  default     = []
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(any)
  default     = []
}

variable "db_subnets" {
  description = "List of public subnets"
  type        = list(any)
  default     = []
}

variable "db_subnets_with_internet" {
  description = "Enable internet in DB subnets"
  type        = bool
  default     = true
}

variable "private_subnets_with_internet" {
  description = "Enable internet in private subnets"
  type        = bool
  default     = true
}

variable "private_subnets_single_nat" {
  description = "Single NAT for all private subnets"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "One NAT per AZ"
  type        = bool
  default     = false
}

# variable "additional_tags" {
#   description = "Additional tags to add"
#   type        = list(string)
#   default     = []
# }

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(any)
  default     = []
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "database_subnet_tags" {
  description = "Additional tags for the database subnets"
  type        = map(string)
  default     = {}
}
