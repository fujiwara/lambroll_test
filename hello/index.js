exports.handler = async function (event, context) {
  console.log("EVENT: \n" + JSON.stringify(event, null, 2))
  // xxx yyy 13
  return context.logStreamName
}
