OPT ?= --function function.jsonnet # --log-level debug
ECR := $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/lambda-hello-world:latest
export DESCRIPTION := Hello, World

build:

deploy:
	lambroll deploy $(OPT) --alias latest # --ignore ".Tags, .Timeout"

deploy-dry-run:
	lambroll deploy $(OPT) --dry-run

status:
	lambroll status $(OPT)

diff:
	lambroll diff $(OPT) # --qualifier current

delete:
	lambroll delete $(OPT)

init:
	lambroll init --function-name hello $(OPT) --jsonnet

invoke:
	lambroll invoke $(OPT)

archive:
	lambroll archive $(OPT)

versions:
	lambroll versions $(OPT)

render:
	@lambroll render $(OPT) # --jsonnet

rollback:
	lambroll rollback $(OPT) --delete-version --alias=latest

build:
	docker build -t $(ECR) .

push: build
	docker --config .docker push $(ECR)

logs:
	lambroll logs $(OPT) --follow
