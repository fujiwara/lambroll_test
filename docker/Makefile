export AWS_ACCOUNT_ID := $(shell aws sts get-caller-identity | jq -r .Account)
export TAG := $(shell date +%s)

main: main.go
	GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build main.go

image: main
	docker build -t lambda-docker:$(TAG) .

push: image
	docker tag lambda-docker:$(TAG) $(AWS_ACCOUNT_ID).dkr.ecr.ap-northeast-1.amazonaws.com/lambda/test:$(TAG)
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.ap-northeast-1.amazonaws.com/lambda/test:$(TAG)

deploy: #push
	lambroll deploy --log-level debug --keep-versions 10 --dry-run

clean:
	rm -f main

invoke:
	lambroll invoke --log-level debug

logs:
	lambroll logs --follow

versions:
	lambroll versions

diff:
	lambroll diff --ignore .ImageConfig
