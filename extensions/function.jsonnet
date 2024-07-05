{
  Architectures: [
    'x86_64',
  ],
  Environment: {
    Variables: {
      FIRETAP_STREAM_NAME: 'firetap',
    },
  },
  EphemeralStorage: {
    Size: 512,
  },
  FunctionName: 'hello-extensions',
  Handler: 'handler',
/*  Layers: [
    'arn:aws:lambda:ap-northeast-1:314472643515:layer:firetap:14',
  ],*/
  LoggingConfig: {
    LogFormat: 'Text',
    LogGroup: '/aws/lambda/hello-extensions',
  },
  MemorySize: 128,
  Role: 'arn:aws:iam::314472643515:role/AWSLambdaBasicExecutionRole',
  Runtime: 'provided.al2023',
  SnapStart: {
    ApplyOn: 'None',
  },
  Timeout: 30,
  TracingConfig: {
    Mode: 'PassThrough',
  },
}
