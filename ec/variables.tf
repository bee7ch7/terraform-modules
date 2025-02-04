variable "create" {
  type        = bool
  description = "Whether to create Elasticsearch deployment or not"
  default     = true
}

variable "name" {
  type        = string
  description = "Elasticsearch stack name"
}

variable "ec_region" {
  type        = string
  description = "Region where Elasticsearch is going to be installed"
  default     = "us-east-1"
}

variable "ec_version" {
  type        = string
  description = "Elasticsearch stack version"
  default     = "8.17.1"
}

variable "ec_deployment_id" {
  type        = string
  description = "Elasticsearch stack deployment id. Required only if traffic filtering related to deployment outside this module"
  default     = null
}

variable "deployment_template_id" {
  type        = string
  description = "Deployment template identifier to create the deployment from"
  default     = "aws-general-purpose-arm"
}

variable "observability" {
  type = object({
    deployment_id = optional(string, null) # Use "self" to deploy observability within same Elasticsearch instance 
    logs          = optional(bool, true)
    metrics       = optional(bool, true)
    ref_id        = optional(string, null)
  })
  description = "Observability configuration block"
  default     = null
}

variable "request_id" {
  type        = string
  description = "Request ID to set when you create the deployment. Use it only when previous attempts return an error and request_id is returned as part of the error."
  default     = null
}

variable "reset_elasticsearch_password" {
  type        = bool
  description = "Explicitly resets the elasticsearch_password when true"
  default     = null
}

variable "traffic_filter_enabled" {
  type        = bool
  description = "Where to add traffic filtering components or not"
  default     = true
}

variable "traffic_filter" {
  # type        = any
  type = map(object({
    type = string
    rules = map(object({
      description = string
      source      = string
    }))
  }))
  description = "List of traffic filters rule identifiers that will be applied to the deployment."
  default     = {}
}

variable "elasticsearch" {
  type = object({
    autoscale         = optional(bool, null)
    hot               = any
    warm              = optional(any, null)
    cold              = optional(any, null)
    frozen            = optional(any, null)
    coordinating      = optional(any, null)
    config            = optional(any, null)
    extension         = optional(any, null)
    keystore_contents = optional(any, null)
    master            = optional(any, null)
    ml                = optional(any, null)
    ref_id            = optional(string, "main-elasticsearch")
    remote_cluster    = optional(map(string), null)
    snapshot          = optional(any, null)
    snapshot_source   = optional(any, null)
    strategy          = optional(string, null)
    trust_account     = optional(any, null)
    trust_external    = optional(any, null)
  })
  description = "Elasticsearch configuration block"
  default = {
    hot = {
      autoscaling = {}
      zone_count  = 1
    }
  }
}

variable "kibana" {
  type        = any
  description = "Kibana configuration block"
  default     = {}
}

variable "integrations_server" {
  type        = any
  description = "Integrations server configuration block"
  default     = {}
}

variable "enterprise_search" {
  type        = any
  description = "Enterprise search configuration block (deprecated)"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Optional map of deployment tags"
  default     = {}
}

variable "extension" {
  type = list(object({
    name           = string
    extension_type = string
    version        = string
    description    = optional(string, null)
    download_url   = optional(string, null)
    file_hash      = optional(string, null)
    file_path      = optional(string, null)
  }))
  description = "List of extensions for Elasticsearch"
  default     = []
}

variable "api_key_ssm_name" {
  type        = string
  description = "SSM Parameter name where EC_API_KEY is saved"
  default     = ""
}

variable "store_ec_credentials_to" {
  type = object({
    username = optional(string, null)
    password = optional(string, null)
  })
  description = "SSM Parameter names to store credentials from Elasticsearch"
  default     = {}
}
