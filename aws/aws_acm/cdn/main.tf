module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"

  providers = {
    aws = aws.acm
  }

  domain_name = var.domain_name
  zone_id     = length(var.root_domain_name) > 0 && var.create_route53_records ? data.aws_route53_zone.this[0].id : null

  subject_alternative_names = var.subject_alternative_names

  create_route53_records = var.create_route53_records
  wait_for_validation    = var.wait_for_validation

}

data "aws_route53_zone" "this" {
  count        = length(var.root_domain_name) > 0 && var.create_route53_records ? 1 : 0
  name         = "${var.root_domain_name}."
  private_zone = false
}
