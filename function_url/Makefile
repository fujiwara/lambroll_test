ALIAS ?= current
export GOOS=linux
export GOARCH=arm64
export RIDGE_STREAMING_RESPONSE?=true

bootstrap: *.go
	go build -o bootstrap main.go

clean:
	rm -f bootstrap

deploy: bootstrap
	lambroll deploy --alias $(ALIAS)

diff:
	lambroll diff
