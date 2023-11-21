{
  Description: 'xxx',
  FunctionName: 'getenv',
  MemorySize: 128,
  Role: 'arn:aws:iam::{{ must_env `AWS_ACCOUNT_ID` }}:role/AWSLambdaBasicExecutionRole',
  Runtime: 'nodejs18.x',
  Handler: 'index.handler',
  Environment: {
    Variables: {
      NODE_ENV: 'production',
      FOO: 'bar',
      BAR: 'baz',
    },
  },
}
