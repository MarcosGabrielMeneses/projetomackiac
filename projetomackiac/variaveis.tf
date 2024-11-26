variable "region" {
  default = "us-east-1"
  description = "Região da AWS onde os recursos serão criados"
}

variable "lambda_runtime" {
  default = "python3.9"
  description = "Ambiente de execução para funções Lambda"
}
