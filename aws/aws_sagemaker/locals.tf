locals {
  user_profiles = {
    default = {
      role_arn  = ""
      role_name = ""
      policies = [
        "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess",
        "arn:aws:iam::aws:policy/AmazonS3FullAccess"
      ]
    }
  }
}