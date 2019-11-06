export AWS_ACCOUNT_ID := $(shell aws sts get-caller-identity --query 'Account' --output text)

build:

deploy:
	lambroll deploy --log-level debug
