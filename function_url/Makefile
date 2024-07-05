ALIAS ?= current

bootstrap: *.go
	go build -o bootstrap main.go

clean:
	rm -f bootstrap

deploy: bootstrap
	lambroll deploy --alias $(ALIAS)
