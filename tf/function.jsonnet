{
  Description: '',
  FunctionName: 'test_lambda',
  MemorySize: 128,
  Role: '{{ env_or_tfstate `ROLE_ARN` `aws_iam_role.lambda.arn` }}',
  Runtime: 'nodejs16.x',
  Handler: 'index.handler',
}
