resource "aws_sagemaker_endpoint" "this" {
  count                = var.create_endpoint ? 1 : 0
  name                 = var.endpoint_name
  endpoint_config_name = aws_sagemaker_endpoint_configuration.this[0].name

  tags = var.tags
}


resource "aws_sagemaker_endpoint_configuration" "this" {
  count = var.create_endpoint_configuration ? 1 : 0
  name  = var.endpoint_config_name

  dynamic "production_variants" {
    for_each = var.production_variants
    content {
      accelerator_type                                  = try(production_variants.value.accelerator_type, null)
      container_startup_health_check_timeout_in_seconds = try(production_variants.value.container_startup_health_check_timeout_in_seconds, 60)
      enable_ssm_access                                 = try(production_variants.value.enable_ssm_access, false)
      initial_instance_count                            = try(production_variants.value.initial_instance_count, "1")
      initial_variant_weight                            = try(production_variants.value.initial_variant_weight, 0)
      instance_type                                     = try(production_variants.value.instance_type, "ml.c5.large")
      model_data_download_timeout_in_seconds            = try(production_variants.value.model_data_download_timeout_in_seconds, 60)
      model_name                                        = production_variants.value.model_name
      variant_name                                      = try(production_variants.key, null)
      volume_size_in_gb                                 = try(production_variants.value.volume_size_in_gb, 30)
    }
  }

  tags = var.tags
}

resource "aws_appautoscaling_target" "this" {
  for_each           = { for k, v in var.production_variants : k => v if length(try(v.autoscaling, "")) > 0 }
  max_capacity       = coalesce(each.value.autoscaling.max_capacity, try(each.value.autoscaling.min_capacity, 1))
  min_capacity       = try(each.value.autoscaling.min_capacity, 1)
  resource_id        = "endpoint/${aws_sagemaker_endpoint.this[0].name}/variant/${each.key}"
  scalable_dimension = "sagemaker:variant:DesiredInstanceCount"
  service_namespace  = "sagemaker"
}


# resource "aws_appautoscaling_policy" "this" {
#   for_each           = { for k, v in var.production_variants : k => v if length(try(v.autoscaling, "")) > 0 }
#   name               = "${each.key}-scaling-policy"
#   policy_type        = each.value.autoscaling.policy_type
#   resource_id        = aws_appautoscaling_target.this[each.key].resource_id
#   scalable_dimension = aws_appautoscaling_target.this[each.key].scalable_dimension
#   service_namespace  = aws_appautoscaling_target.this[each.key].service_namespace

#   target_tracking_scaling_policy_configuration {

#     predefined_metric_specification {
#       predefined_metric_type = each.value.autoscaling.predefined_metric_type
#     }

#     target_value       = 100
#     scale_in_cooldown  = 300
#     scale_out_cooldown = 300
#   }
# }


resource "aws_appautoscaling_policy" "this" {
  for_each = { for k, v in var.production_variants : k => v if length(try(v.autoscaling, "")) > 0 }

  name               = try(each.value.name, each.key)
  policy_type        = try(each.value.policy_type, "TargetTrackingScaling")
  resource_id        = aws_appautoscaling_target.this[each.key].resource_id
  scalable_dimension = aws_appautoscaling_target.this[each.key].scalable_dimension
  service_namespace  = aws_appautoscaling_target.this[each.key].service_namespace

  dynamic "step_scaling_policy_configuration" {
    for_each = try([each.value.autoscaling.step_scaling_policy_configuration], [])

    content {
      adjustment_type          = try(step_scaling_policy_configuration.value.adjustment_type, null)
      cooldown                 = try(step_scaling_policy_configuration.value.cooldown, null)
      metric_aggregation_type  = try(step_scaling_policy_configuration.value.metric_aggregation_type, null)
      min_adjustment_magnitude = try(step_scaling_policy_configuration.value.min_adjustment_magnitude, null)

      dynamic "step_adjustment" {
        for_each = try(step_scaling_policy_configuration.value.step_adjustment, [])

        content {
          metric_interval_lower_bound = try(step_adjustment.value.metric_interval_lower_bound, null)
          metric_interval_upper_bound = try(step_adjustment.value.metric_interval_upper_bound, null)
          scaling_adjustment          = try(step_adjustment.value.scaling_adjustment, null)
        }
      }
    }
  }

  dynamic "target_tracking_scaling_policy_configuration" {
    for_each = try(each.value.autoscaling.policy_type, null) == "TargetTrackingScaling" ? try([each.value.autoscaling.target_tracking_scaling_policy_configuration], []) : []

    content {
      dynamic "customized_metric_specification" {
        for_each = try([target_tracking_scaling_policy_configuration.value.customized_metric_specification], [])

        content {
          dynamic "dimensions" {
            for_each = try(customized_metric_specification.value.dimensions, [])

            content {
              name  = dimensions.value.name
              value = dimensions.value.value
            }
          }

          metric_name = customized_metric_specification.value.metric_name
          namespace   = customized_metric_specification.value.namespace
          statistic   = customized_metric_specification.value.statistic
          unit        = try(customized_metric_specification.value.unit, null)
        }
      }

      disable_scale_in = try(target_tracking_scaling_policy_configuration.value.disable_scale_in, null)

      dynamic "predefined_metric_specification" {
        for_each = try([target_tracking_scaling_policy_configuration.value.predefined_metric_specification], [])

        content {
          predefined_metric_type = predefined_metric_specification.value.predefined_metric_type
          resource_label         = try(predefined_metric_specification.value.resource_label, null)
        }
      }

      scale_in_cooldown  = try(target_tracking_scaling_policy_configuration.value.scale_in_cooldown, 300)
      scale_out_cooldown = try(target_tracking_scaling_policy_configuration.value.scale_out_cooldown, 60)
      target_value       = try(target_tracking_scaling_policy_configuration.value.target_value, 75)
    }
  }
}

