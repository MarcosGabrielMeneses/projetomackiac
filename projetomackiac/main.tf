provider "aws" {
  region = "us-east-1"
}

module "lambda" {
  source = "./modules/lambda"
}

module "sqs" {
  source = "./modules/sqs"
}
