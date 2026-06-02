variable "project" {
  type    = string
  default = "lambroll"
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      "env" = "${var.project}"
    }
  }
}

terraform {
  required_version = ">= 1.4.0"

  backend "s3" {
    bucket = "lambroll-test-tfstate"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.40.0"
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "random_string" "random" {
  length  = 9
  lower   = true
  special = false
}

output "project_name" {
  value = "${var.project}-${random_string.random.result}"
}
