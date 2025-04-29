local env = std.native('env');
{
  Config: {
    AuthType: 'NONE',
    InvokeMode: if env('RIDGE_STREAMING_RESPONSE','') == '' then 'BUFFERED' else 'RESPONSE_STREAM',
  },
}
