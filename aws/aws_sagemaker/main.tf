resource "aws_sagemaker_domain" "this" {
  count       = var.create_sagemaker_domain ? 1 : 0
  auth_mode   = var.auth_mode
  domain_name = var.domain_name
  subnet_ids  = var.subnet_ids
  vpc_id      = var.vpc_id

  default_user_settings {
    execution_role    = var.create_default_execution_role ? aws_iam_role.default[0].arn : var.default_execution_role_arn
    studio_web_portal = var.default_studio_web_portal
  }

  tags = var.tags
}

resource "aws_iam_role" "default" {
  count              = var.create_default_execution_role ? 1 : 0
  name               = try(length(var.default_execution_role_name) > 0, "sagemaker-default-${var.domain_name}-execution-role")
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.default[0].json

  tags = var.tags
}

data "aws_iam_policy_document" "default" {
  count = var.create_default_execution_role ? 1 : 0
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_sagemaker_user_profile" "this" {
  for_each          = var.user_profiles
  domain_id         = aws_sagemaker_domain.this[0].id
  user_profile_name = each.key
  user_settings {
    # default_landing_uri = null
    execution_role = each.value.role_arn != null ? each.value.role_arn : module.user_profile_execution_role[each.key].iam_role_arn
    # security_groups     = []
    # studio_web_portal   = null
    space_storage_settings {
      default_ebs_storage_settings {
        default_ebs_volume_size_in_gb = try(each.value.default_ebs_volume_size_in_gb, 5)
        maximum_ebs_volume_size_in_gb = try(each.value.maximum_ebs_volume_size_in_gb, 100)
      }
    }
  }
  tags = var.tags
}

module "user_profile_execution_role" {
  source = "./modules/iam-assumable-role//."

  for_each                = { for k, v in var.user_profiles : k => v if v.role_arn == null }
  create_role             = true
  role_requires_mfa       = false
  role_name               = "sagemaker-${each.key}-user-${var.domain_name}-execution-role"
  trusted_role_services   = var.user_profile_trusted_role_services
  custom_role_policy_arns = each.value.policies

  tags = var.tags
}
