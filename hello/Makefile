export AWS_ACCOUNT_ID := $(shell aws sts get-caller-identity --query 'Account' --output text)
OPT := --function function.jsonnet --log-level debug --ext-str accountID=$(AWS_ACCOUNT_ID) --ext-code memorySize=128
ECR := $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/lambda-hello-world:latest

build:

deploy:
	lambroll deploy $(OPT)

deploy-dry-run:
	lambroll deploy $(OPT) --dry-run

diff:
	lambroll diff $(OPT)

delete:
	lambroll delete $(OPT)

init:
	lambroll init --function-name hello $(OPT)

invoke:
	lambroll invoke $(OPT)

versions:
	lambroll versions $(OPT)

build:
	docker build -t $(ECR) .

push: build
	docker --config .docker push $(ECR)
