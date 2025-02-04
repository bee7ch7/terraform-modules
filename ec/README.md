
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.30 |
| <a name="requirement_ec"></a> [ec](#requirement\_ec) | 0.12.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.30 |
| <a name="provider_ec"></a> [ec](#provider\_ec) | 0.12.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.username](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [ec_deployment.this](https://registry.terraform.io/providers/elastic/ec/0.12.2/docs/resources/deployment) | resource |
| [ec_deployment_extension.this](https://registry.terraform.io/providers/elastic/ec/0.12.2/docs/resources/deployment_extension) | resource |
| [ec_deployment_traffic_filter.this](https://registry.terraform.io/providers/elastic/ec/0.12.2/docs/resources/deployment_traffic_filter) | resource |
| [ec_deployment_traffic_filter_association.this](https://registry.terraform.io/providers/elastic/ec/0.12.2/docs/resources/deployment_traffic_filter_association) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_ssm_name"></a> [api\_key\_ssm\_name](#input\_api\_key\_ssm\_name) | SSM Parameter name where EC\_API\_KEY is saved | `string` | `""` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create Elasticsearch deployment or not | `bool` | `true` | no |
| <a name="input_deployment_template_id"></a> [deployment\_template\_id](#input\_deployment\_template\_id) | Deployment template identifier to create the deployment from | `string` | `"aws-general-purpose-arm"` | no |
| <a name="input_ec_deployment_id"></a> [ec\_deployment\_id](#input\_ec\_deployment\_id) | Elasticsearch stack deployment id. Required only if traffic filtering related to deployment outside this module | `string` | `null` | no |
| <a name="input_ec_region"></a> [ec\_region](#input\_ec\_region) | Region where Elasticsearch is going to be installed | `string` | `"us-east-1"` | no |
| <a name="input_ec_version"></a> [ec\_version](#input\_ec\_version) | Elasticsearch stack version | `string` | `"8.17.1"` | no |
| <a name="input_elasticsearch"></a> [elasticsearch](#input\_elasticsearch) | Elasticsearch configuration block | <pre>object({<br>    autoscale         = optional(bool, null)<br>    hot               = any<br>    warm              = optional(any, null)<br>    cold              = optional(any, null)<br>    frozen            = optional(any, null)<br>    coordinating      = optional(any, null)<br>    config            = optional(any, null)<br>    extension         = optional(any, null)<br>    keystore_contents = optional(any, null)<br>    master            = optional(any, null)<br>    ml                = optional(any, null)<br>    ref_id            = optional(string, "main-elasticsearch")<br>    remote_cluster    = optional(map(string), null)<br>    snapshot          = optional(any, null)<br>    snapshot_source   = optional(any, null)<br>    strategy          = optional(string, null)<br>    trust_account     = optional(any, null)<br>    trust_external    = optional(any, null)<br>  })</pre> | <pre>{<br>  "hot": {<br>    "autoscaling": {},<br>    "zone_count": 1<br>  }<br>}</pre> | no |
| <a name="input_enterprise_search"></a> [enterprise\_search](#input\_enterprise\_search) | Enterprise search configuration block (deprecated) | `any` | `null` | no |
| <a name="input_extension"></a> [extension](#input\_extension) | List of extensions for Elasticsearch | <pre>list(object({<br>    name           = string<br>    extension_type = string<br>    version        = string<br>    description    = optional(string, null)<br>    download_url   = optional(string, null)<br>    file_hash      = optional(string, null)<br>    file_path      = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_integrations_server"></a> [integrations\_server](#input\_integrations\_server) | Integrations server configuration block | `any` | `{}` | no |
| <a name="input_kibana"></a> [kibana](#input\_kibana) | Kibana configuration block | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Elasticsearch stack name | `string` | n/a | yes |
| <a name="input_observability"></a> [observability](#input\_observability) | Observability configuration block | <pre>object({<br>    deployment_id = optional(string, null) # Use "self" to deploy observability within same Elasticsearch instance<br>    logs          = optional(bool, true)<br>    metrics       = optional(bool, true)<br>    ref_id        = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_request_id"></a> [request\_id](#input\_request\_id) | Request ID to set when you create the deployment. Use it only when previous attempts return an error and request\_id is returned as part of the error. | `string` | `null` | no |
| <a name="input_reset_elasticsearch_password"></a> [reset\_elasticsearch\_password](#input\_reset\_elasticsearch\_password) | Explicitly resets the elasticsearch\_password when true | `bool` | `null` | no |
| <a name="input_store_ec_credentials_to"></a> [store\_ec\_credentials\_to](#input\_store\_ec\_credentials\_to) | SSM Parameter names to store credentials from Elasticsearch | <pre>object({<br>    username = optional(string, null)<br>    password = optional(string, null)<br>  })</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional map of deployment tags | `map(string)` | `{}` | no |
| <a name="input_traffic_filter"></a> [traffic\_filter](#input\_traffic\_filter) | List of traffic filters rule identifiers that will be applied to the deployment. | <pre>map(object({<br>    type = string<br>    rules = map(object({<br>      description = string<br>      source      = string<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_traffic_filter_enabled"></a> [traffic\_filter\_enabled](#input\_traffic\_filter\_enabled) | Where to add traffic filtering components or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias"></a> [alias](#output\_alias) | Elasticsearch stack alias |
| <a name="output_ec_version"></a> [ec\_version](#output\_ec\_version) | Elasticsearch stack alias |
| <a name="output_elasticsearch_credentials"></a> [elasticsearch\_credentials](#output\_elasticsearch\_credentials) | Elasticsearch credentials |
| <a name="output_elasticsearch_endpoints"></a> [elasticsearch\_endpoints](#output\_elasticsearch\_endpoints) | Elasticsearch endpoints |
| <a name="output_integration_server_endpoints"></a> [integration\_server\_endpoints](#output\_integration\_server\_endpoints) | Integration server endpoints |
| <a name="output_kibana_endpoints"></a> [kibana\_endpoints](#output\_kibana\_endpoints) | Kibana endpoints |
| <a name="output_region"></a> [region](#output\_region) | Elasticsearch stack deployment region |
| <a name="output_ssm_parameter_names"></a> [ssm\_parameter\_names](#output\_ssm\_parameter\_names) | Kibana endpoints |
| <a name="output_stack_name"></a> [stack\_name](#output\_stack\_name) | Elasticsearch stack alias |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Example:

```
inputs = {
  api_key_ssm_name       = local.api_key_ssm_name
  name                   = local.name
  ec_region              = "us-east-1"
  ec_version             = "8.17.1"
  deployment_template_id = "aws-general-purpose-arm"

  store_ec_credentials_to = {
    username = local.ec_username_path
    password = local.ec_password_path
  }

  elasticsearch = {

    hot = {
      autoscaling = {}
      zone_count  = 1
    }

    # extension = [
    #   {
    #     name    = "1ext.name"
    #     type    = "bundle"
    #     version = "1data.ec_stack.latest.version"
    #     url     = "1ext.url"
    #   },
    #   {
    #     name    = "2ext.name"
    #     type    = "bundle"
    #     version = "2data.ec_stack.latest.version"
    #     url     = "2ext.url"
    #   }
    # ]
  }

  kibana = {
    zone_count = 1
  }

  integrations_server = {
    zone_count = 1
  }

  observability = {
    deployment_id = "self"
  }

  # traffic_filter_enabled = true
  traffic_filter = {
    "${local.environment}-common" = {
      type = "ip"
      rules = {
        1 = {
          description = "Allow access from internet"
          source      = "0.0.0.0/0"
        }
      }
    }
  }

  # extension = [
  #   {
  #     name           = "some-name1"
  #     extension_type = "bundle"
  #     version        = "34.3.5"
  #     description    = "hello1"
  #     download_url   = "https://keel.com/213"
  #   },
  #   {
  #     name           = "pluginname1"
  #     extension_type = "plugin"
  #     version        = "1.3.5"
  #     description    = "pl"
  #     download_url   = "https://kplubin.comm/213"
  #   },
  # ]

  tags = local.common_tags.locals.common_tags

}
```
