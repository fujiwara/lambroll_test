{
  Architectures: [
    'x86_64',
  ],
  Code: {
    ImageUri: '314472643515.dkr.ecr.ap-northeast-1.amazonaws.com/lambda/test:1696559117',
  },
  Description: '',
  Environment: {
    Variables: {
      FOO: 'xBAR',
      TAG: '1696559117',
    },
  },
  EphemeralStorage: {
    Size: 512,
  },
  FunctionName: 'docker-test',
  ImageConfig: {
    Command: [
      '',
    ],
    EntryPoint: [
      '/usr/local/bin/main',
    ],
    WorkingDirectory: '/var/task',
  },
  MemorySize: 128,
  PackageType: 'Image',
  Role: 'arn:aws:iam::314472643515:role/test_lambda_function',
  SnapStart: {
    ApplyOn: 'None',
  },
  Timeout: 30,
  TracingConfig: {
    Mode: 'PassThrough',
  },
}
