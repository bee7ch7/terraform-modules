locals {
  extension_resources = [
    for ext in ec_deployment_extension.this : {
      name    = ext.name
      type    = ext.extension_type
      version = ext.version
      url     = ext.url
    }
  ]
}

resource "ec_deployment" "this" {
  count = var.create ? 1 : 0

  name                   = var.name
  region                 = var.ec_region
  version                = var.ec_version
  deployment_template_id = var.deployment_template_id

  observability                = var.observability
  request_id                   = var.request_id
  reset_elasticsearch_password = var.reset_elasticsearch_password

  elasticsearch = {
    hot          = var.elasticsearch.hot
    warm         = var.elasticsearch.warm
    cold         = var.elasticsearch.cold
    frozen       = var.elasticsearch.frozen
    coordinating = var.elasticsearch.coordinating
    extension    = length(ec_deployment_extension.this) > 0 ? local.extension_resources : var.elasticsearch.extension
  }

  kibana              = var.kibana
  enterprise_search   = var.enterprise_search
  integrations_server = var.integrations_server

  tags = var.tags
}

resource "ec_deployment_traffic_filter" "this" {
  for_each = var.traffic_filter_enabled ? var.traffic_filter : {}

  name   = each.key
  region = var.ec_region
  type   = each.value.type

  dynamic "rule" {
    for_each = each.value.rules
    content {
      azure_endpoint_guid = try(rule.value.azure_endpoint_guid, null)
      azure_endpoint_name = try(rule.value.azure_endpoint_name, null)
      description         = "${each.key} ${rule.value.description}"
      source              = try(rule.value.source, null)
    }
  }
}

resource "ec_deployment_traffic_filter_association" "this" {
  for_each = var.traffic_filter_enabled ? ec_deployment_traffic_filter.this : {}

  traffic_filter_id = each.value.id
  deployment_id     = var.create ? ec_deployment.this[0].id : var.ec_deployment_id
}

resource "ec_deployment_extension" "this" {
  for_each = { for k, v in var.extension : v.name => v }

  name           = each.value.name
  version        = try(each.value.version, var.ec_version)
  extension_type = each.value.extension_type

  description  = each.value.description
  download_url = each.value.download_url
  file_hash    = each.value.file_hash
  file_path    = each.value.file_path
}

resource "aws_ssm_parameter" "username" {
  count = length(var.store_ec_credentials_to) > 0 ? 1 : 0
  name  = var.store_ec_credentials_to.username
  type  = "SecureString"
  value = ec_deployment.this[0].elasticsearch_username
}

resource "aws_ssm_parameter" "password" {
  count = length(var.store_ec_credentials_to) > 0 ? 1 : 0
  name  = var.store_ec_credentials_to.password
  type  = "SecureString"
  value = ec_deployment.this[0].elasticsearch_password
}