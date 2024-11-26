resource "aws_lambda_function" "query_handler" {
  function_name = "query_handler"
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "handler.query"

  filename = "${path.module}/lambda_query.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_query.zip")
}

resource "aws_lambda_function" "command_handler" {
  function_name = "command_handler"
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "handler.command"

  filename = "${path.module}/lambda_command.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_command.zip")
}
