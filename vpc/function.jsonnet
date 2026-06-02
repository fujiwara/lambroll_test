local tfstate = std.native('tfstate');
local name = tfstate('output.project_name');
{
  Architectures: [
    'x86_64',
  ],
  Environment: {
    Variables: {
    },
  },
  EphemeralStorage: {
    Size: 512,
  },
  FunctionName: name,
  Handler: 'app.handler',
  LoggingConfig: {
    ApplicationLogLevel: 'DEBUG',
    LogFormat: 'JSON',
    LogGroup: '/aws/lambda/' + name,
    SystemLogLevel: 'INFO',
  },
  MemorySize: 128,
  Role: tfstate('aws_iam_role.lambda.arn'),
  Runtime: 'python3.13',
  SnapStart: {
    ApplyOn: 'None',
  },
  Tags: {
    Project: name,
  },
  Timeout: 10,
  TracingConfig: {
    Mode: 'PassThrough',
  },
  VpcConfig: {
    SecurityGroupIds: [
      tfstate('aws_security_group.https.id'),
      tfstate('aws_security_group.default.id'),
    ],
    SubnetIds: [
      //tfstate('aws_subnet.public["c"].id'),
      tfstate('aws_subnet.public["d"].id'),
      tfstate('aws_subnet.public["a"].id'),
    ],
  },
}
