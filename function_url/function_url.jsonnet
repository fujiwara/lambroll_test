{
  Config: {
    AuthType: 'AWS_IAM',
    Cors: {
      AllowOrigins: [
        '*',
      ],
    },
    InvokeMode: 'BUFFERED',
    Qualifier: 'current',
  },
  Permissions: [
    {
      Principal: 'cloudfront.amazonaws.com',
      SourceArn: 'arn:aws:cloudfront::314472643515:distribution/EJUBO80Y6991M',
    },
  ],
}
