{
  //Architectures: ['amd64'],
  Environment: {
    Variables: {
      NOW: '{{ must_env `NOW` }}',
    },
  },
  Description: '',
  FunctionName: 'hello',
  _LoggingConfig: {
    ApplicationLogLevel: 'DEBUG',
    LogFormat: 'JSON',
    LogGroup: '/aws/lambda/hello_json',
    SystemLogLevel: 'INFO',
  },
  MemorySize: std.extVar('memorySize'),
  Role: 'arn:aws:iam::%s:role/test_lambda_role' % [ std.extVar('accountID') ],
  Tags: {
    Env: 'dev',
    Foo: 'barzz',
  },
  Timeout: 5,
  TracingConfig: {
    Mode: 'PassThrough',
  },
  //Code: {
    //ImageUri: '079121286994.dkr.ecr.ap-northeast-1.amazonaws.com/lambda-hello-world:latest',
  //},
  //PackageType: 'Image',
    Runtime: 'python3.9',
    Handler: 'app.handler',
}
