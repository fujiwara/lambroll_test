ALIAS ?= current
export GOOS=linux
export GOARCH=arm64

bootstrap: *.go
	go build -o bootstrap main.go

clean:
	rm -f bootstrap

deploy: bootstrap
	lambroll deploy --alias $(ALIAS)
