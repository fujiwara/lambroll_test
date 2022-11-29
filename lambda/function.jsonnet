{
  Description: 'xxx',
  FunctionName: 'test_lambda',
  MemorySize: 128,
  Role: '{{or (env `ROLE_ARN` ``) (tfstate `aws_iam_role.lambda.arn`)}}',
  Runtime: 'nodejs16.x',
  Handler: 'index.handler',
}
