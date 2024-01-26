{
  Architectures: [
    'x86_64',
  ],
  Description: '',
  EphemeralStorage: {
    Size: 512,
  },
  FunctionName: 'java11-hello',
  Handler: 'example.Hello::handleRequest',
  MemorySize: 512,
  Role: 'arn:aws:iam::079121286994:role/service-role/java11-hello-role-jqeriu0o',
  Runtime: 'java11',
  SnapStart: {
    ApplyOn: 'PublishedVersions',
  },
  Timeout: 15,
  TracingConfig: {
    Mode: 'PassThrough',
  },
}
