{
  FunctionName: 'vpc-bash',
  Handler: 'index.handler',
  Environment:{},
  MemorySize: 128,
  Role: 'arn:aws:iam::314472643515:role/vpc-lambda-invoker',
  Runtime: 'provided.al2023',
  Layers: [
    "arn:aws:lambda:ap-northeast-1:314472643515:layer:lamux:11",
  ],
  VpcConfig: {
    SubnetIds: ['subnet-0376f113bbbc25742'],
    SecurityGroupIds: ['sg-0a69199a34e15147a'],
  },
  Timeout: 3,
}
