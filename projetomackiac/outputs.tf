output "lambda_query_function_name" {
  value = module.lambda.query_function_name
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}
