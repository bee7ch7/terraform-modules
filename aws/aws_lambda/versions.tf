terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.29"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
  }
}
