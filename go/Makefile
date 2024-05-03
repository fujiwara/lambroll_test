export AWS_ACCOUNT_ID := $(shell aws sts get-caller-identity --query 'Account' --output text)

build:

bootstrap: *.go go.*
	GOOS=linux GOARCH=arm64 go build -o bootstrap main.go
	file bootstrap

clean:
	rm -f bootstrap

deploy: bootstrap
	lambroll deploy --log-level debug

diff:
	lambroll diff --log-level debug

delete:
	lambroll delete --log-level debug

init:
	lambroll init --log-level debug --function-name hello

invoke:
	lambroll invoke --log-level debug

versions:
	lambroll versions --log-level debug
