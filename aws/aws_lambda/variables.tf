variable "create_lambda" {
  type        = bool
  default     = true
  description = "Whether to create default lambda permissions or not"
}

variable "create_default_role" {
  type        = bool
  default     = false
  description = "Whether to create default lambda permissions or not"
}

variable "basic_role_name" {
  type        = string
  default     = "default_role_name"
  description = "Whether to create default lambda permissions or not"
}

variable "create_dummy_lambda" {
  type        = bool
  default     = false
  description = "Whether to create dummy lambda permissions or not"
}

variable "dummy_filename" {
  type        = string
  default     = "dummy-file.txt"
  description = "Whether to create dummy lambda permissions or not"
}

variable "dummy_content" {
  type        = string
  default     = "hello"
  description = "Whether to create dummy lambda permissions or not"
}

variable "filename" {
  type        = string
  default     = ""
  description = "Path to zip file"
}

variable "lambda_name" {
  type        = string
  default     = ""
  description = "Lambda name"
}

variable "lambda_role" {
  type        = string
  default     = ""
  description = "Lambda custom role ARN"
}

variable "handler" {
  type        = string
  default     = "index.handler"
  description = "Handler, for example: index.handler"
}

variable "timeout" {
  type        = number
  default     = 3
  description = "Lambda execution time limit in seconds"
}

variable "runtime" {
  type        = string
  default     = "nodejs18.x"
  description = "Handler, for example: nodejs18.x"
}

variable "ignore_source_code_hash" {
  description = "Whether to ignore changes to the function's source code hash. Set to true if you manage infrastructure and code deployments separately."
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "ephemeral_storage_size" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = number
  default     = 512
}

variable "vpc_subnet_ids" {
  description = "List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets."
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group ids when Lambda Function should run in the VPC."
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "create_custom_policies" {
  type        = bool
  default     = false
  description = "description"
}

variable "policies" {
  description = "Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format"
  type        = map(string)
  default     = {}
}

variable "custom_policies" {
  description = "The URL of the identity provider. Corresponds to the iss claim"
  type        = map(any)
  default     = {}
}

variable "layers" {
  description = "List of layer arns"
  type        = list(any)
  default     = []
}
