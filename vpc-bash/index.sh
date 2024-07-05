set -x

function handler () {
  EVENT_DATA=$1
  curl -s --max-time 2 -H "Host: current-ridge-hello.localdomain" http://localhost:8080
}
