{
  Architectures: [
    'x86_64',
  ],
  Environment: {
    Variables: {
      Account: '079121286994',
      Arn: 'arn:aws:iam::079121286994:user/fujiwara-shunichiro',
      UserId: 'AIDAJ3OG2XJN4U7FCLFVU',
    },
  },
  EphemeralStorage: {
    Size: 512,
  },
  FunctionName: 'hello',
  Handler: 'app.handler',
  LoggingConfig: {
    ApplicationLogLevel: 'DEBUG',
    LogFormat: 'JSON',
    LogGroup: '/aws/lambda/hello_json',
    SystemLogLevel: 'INFO',
  },
  MemorySize: 128,
  Role: 'arn:aws:iam::079121286994:role/test_lambda_role',
  Runtime: 'python3.9',
  SnapStart: {
    ApplyOn: 'None',
  },
  Tags: {
    Env: 'dev',
    Foo: 'barzz',
  },
  Timeout: 5,
  TracingConfig: {
    Mode: 'PassThrough',
  },
}
