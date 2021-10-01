package main

import (
	"context"
	"os"

	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Name string `json:"name"`
}

func HandleRequest(ctx context.Context, name MyEvent) (string, error) {
	b, _ := os.ReadFile("/proc/cpuinfo")
	return string(b), nil
}

func main() {
	lambda.Start(HandleRequest)
}
