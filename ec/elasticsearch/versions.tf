terraform {
  required_version = ">= 1.0"

  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "0.12.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.30"
    }
  }
}

provider "ec" {
  apikey = data.aws_ssm_parameter.this.value
}

data "aws_ssm_parameter" "this" {
  name            = var.api_key_ssm_name
  with_decryption = true
}
