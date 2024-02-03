<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones | `list(any)` | `[]` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The CIDR block for the VPC. | `string` | `"10.0.0.0/8"` | no |
| <a name="input_database_subnet_tags"></a> [database\_subnet\_tags](#input\_database\_subnet\_tags) | Additional tags for the database subnets | `map(string)` | `{}` | no |
| <a name="input_db_subnets"></a> [db\_subnets](#input\_db\_subnets) | List of public subnets | `list(any)` | `[]` | no |
| <a name="input_db_subnets_with_internet"></a> [db\_subnets\_with\_internet](#input\_db\_subnets\_with\_internet) | Enable internet in DB subnets | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | the name of your environment, e.g. "prod" | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | the name of your stack, e.g. "demo" | `any` | n/a | yes |
| <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az) | One NAT per AZ | `bool` | `false` | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | Additional tags for the private subnets | `map(string)` | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnets | `list(any)` | `[]` | no |
| <a name="input_private_subnets_single_nat"></a> [private\_subnets\_single\_nat](#input\_private\_subnets\_single\_nat) | Single NAT for all private subnets | `bool` | `true` | no |
| <a name="input_private_subnets_with_internet"></a> [private\_subnets\_with\_internet](#input\_private\_subnets\_with\_internet) | Enable internet in private subnets | `bool` | `true` | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Additional tags for the public subnets | `map(string)` | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnets | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_route_table_ids"></a> [all\_route\_table\_ids](#output\_all\_route\_table\_ids) | n/a |
| <a name="output_all_subnet_ids"></a> [all\_subnet\_ids](#output\_all\_subnet\_ids) | n/a |
| <a name="output_db_availability_zones"></a> [db\_availability\_zones](#output\_db\_availability\_zones) | n/a |
| <a name="output_db_route_table_ids"></a> [db\_route\_table\_ids](#output\_db\_route\_table\_ids) | n/a |
| <a name="output_db_subnet_ids"></a> [db\_subnet\_ids](#output\_db\_subnet\_ids) | n/a |
| <a name="output_db_subnets"></a> [db\_subnets](#output\_db\_subnets) | n/a |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | n/a |
| <a name="output_private_availability_zones"></a> [private\_availability\_zones](#output\_private\_availability\_zones) | n/a |
| <a name="output_private_availability_zones_no_az1e"></a> [private\_availability\_zones\_no\_az1e](#output\_private\_availability\_zones\_no\_az1e) | n/a |
| <a name="output_private_route_table_ids"></a> [private\_route\_table\_ids](#output\_private\_route\_table\_ids) | n/a |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_private_subnet_ids_no_az1e"></a> [private\_subnet\_ids\_no\_az1e](#output\_private\_subnet\_ids\_no\_az1e) | n/a |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | n/a |
| <a name="output_public_availability_zones"></a> [public\_availability\_zones](#output\_public\_availability\_zones) | n/a |
| <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | n/a |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->
