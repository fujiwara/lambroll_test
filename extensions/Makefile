export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0

bootstrap: *.go go.mod go.sum
	go build -o bootstrap main.go

clean:
	rm -f bootstrap *.zip extensions/*

deploy: bootstrap
	lambroll deploy
