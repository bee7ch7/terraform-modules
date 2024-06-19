resource "aws_sagemaker_model" "this" {
  count = var.create_model ? 1 : 0
  name  = var.name

  enable_network_isolation = var.enable_network_isolation                                                                    # false
  execution_role_arn       = var.execution_role_arn == null ? module.execution_role[0].iam_role_arn : var.execution_role_arn # "arn:aws:iam::563505218574:role/service-role/AmazonSageMaker-ExecutionRole-20240603T130022"


  primary_container {
    container_hostname = try(var.primary_container.container_hostname, null) # null
    environment        = try(var.primary_container.environment, {})          # {}
    image              = var.primary_container.image                         # "563505218574.dkr.ecr.us-east-1.amazonaws.com/ml-containers:cnn_model_baseline"
    mode               = try(var.primary_container.mode, "SingleModel")      # "SingleModel"
    model_data_url     = try(var.primary_container.model_data_url, null)     # "s3://vwd-ml-models/CNNBaseline/cnn_model_baseline.tar.gz"
    model_package_name = try(var.primary_container.model_package_name, null) # null
    model_data_source {
      s3_data_source {
        compression_type = try(var.primary_container.compression_type, "Gzip") # "Gzip"
        s3_data_type     = try(var.primary_container.s3_data_type, "S3Object") # "S3Object"
        s3_uri           = var.primary_container.s3_uri                        # "s3://vwd-ml-models/CNNBaseline/cnn_model_baseline.tar.gz"
      }
    }
  }


  tags = merge(var.tags, var.model_tags)
  # tags = {
  #   "sagemaker:domain-arn"       = "arn:aws:sagemaker:us-east-1:563505218574:domain/d-bm2diz0f1spr"
  #   "sagemaker:user-profile-arn" = "arn:aws:sagemaker:us-east-1:563505218574:user-profile/d-bm2diz0f1spr/default-20240603t130019"
  # }
  # tags_all = {
  #   "sagemaker:domain-arn"       = "arn:aws:sagemaker:us-east-1:563505218574:domain/d-bm2diz0f1spr"
  #   "sagemaker:user-profile-arn" = "arn:aws:sagemaker:us-east-1:563505218574:user-profile/d-bm2diz0f1spr/default-20240603t130019"
  # }
}

module "execution_role" {
  source = "../iam-assumable-role//."

  count                   = var.execution_role_arn == null ? 1 : 0
  create_role             = true
  role_requires_mfa       = false
  role_name               = "sagemaker-${var.name}-model-execution-role"
  trusted_role_services   = var.trusted_role_services
  custom_role_policy_arns = var.policies_arns

  tags = var.tags
}
