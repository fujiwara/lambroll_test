{
  Architectures: [
    'x86_64',
  ],
  Description: 'xxx yyyy',
  Environment: {
    Variables: {
      BAR: 'bazx',
      FOO: 'barx',
      NODE_ENV: 'production',
    },
  },
  EphemeralStorage: {
    Size: 512,
  },
  FunctionName: 'getenv',
  Handler: 'index.handler',
  LoggingConfig: {
    LogFormat: 'Text',
    LogGroup: '/aws/lambda/getenv',
  },
  MemorySize: 128,
  Role: 'arn:aws:iam::079121286994:role/AWSLambdaBasicExecutionRole',
  Runtime: 'nodejs18.x',
  SnapStart: {
    ApplyOn: 'None',
  },
  Tags: {},
  Timeout: 30,
  TracingConfig: {
    Mode: 'PassThrough',
  },
}
