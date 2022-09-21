{
  Description: '',
  FunctionName: 'test_lambda',
  MemorySize: 128,
  Role: '{{ must_env `ROLE_ARN` }}',
  Runtime: 'nodejs16.x',
  Handler: 'index.handler',
}
