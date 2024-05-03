provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

resource "aws_iam_role" "lambda" {
  name = "test_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "null_resource" "lambda" {
  triggers = {
    role_arn = aws_iam_role.lambda.arn
  }

  provisioner "local-exec" {
    command     = "lambroll deploy --tfstate ../tf/terraform.tfstate"
    working_dir = "../lambda"
    environment = {
      ROLE_ARN = aws_iam_role.lambda.arn
    }
  }

  provisioner "local-exec" {
    command     = "lambroll delete --tfstate ../tf/terraform.tfstate"
    working_dir = "../lambda"
    when        = destroy
  }

  depends_on = [
    aws_iam_role_policy_attachment.lambda,
  ]
}

data "aws_lambda_function" "lambda" {
  function_name = "test_lambda"
  depends_on = [
    null_resource.lambda
  ]
}

resource "aws_lambda_function_url" "lambda" {
  function_name      = data.aws_lambda_function.lambda.function_name
  authorization_type = "NONE"
}
