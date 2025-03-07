local caller = std.native('caller_identity')();
local env = std.native('env');
{
  Architectures: [
    'arm64',
  ],
  EphemeralStorage: {
    Size: 512,
  },
  Environment: {
    Variables: {
      ALIAS: env('ALIAS', 'latest'),
    },
  },
  FunctionName: 'hello-ridge',
  Handler: 'bootstrap',
  LoggingConfig: {
    LogFormat: 'Text',
    LogGroup: '/aws/lambda/hello-ridge',
  },
  MemorySize: 128,
  Role: 'arn:aws:iam::%s:role/AWSLambdaBasicExecutionRole' % [caller.Account],
  Runtime: 'provided.al2023',
  SnapStart: {
    ApplyOn: 'None',
  },
  Timeout: 30,
  TracingConfig: {
    Mode: 'PassThrough',
  },
}
