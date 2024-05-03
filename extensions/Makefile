export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0

handler: *.go go.mod go.sum
	go build -o handler main.go

bootstrap:

clean:
	rm -f handler *.zip extensions/*

deploy: bootstrap handler
	lambroll deploy
