Projeto IaC - Infraestrutura como Código com Terraform
Este projeto implementa uma solução de Infraestrutura como Código (IaC) para criar uma topologia baseada em AWS Lambda, API Gateway e Amazon SQS. Ele atende aos requisitos descritos no trabalho individual e é organizado para facilitar o entendimento, manutenção e reutilização.

1. Pré-requisitos
Antes de executar este projeto, certifique-se de ter instalado e configurado:

Terraform
AWS CLI configurado com as credenciais: 

aws configure

Python (para o código das funções Lambda).

2. Estrutura do Projeto
A estrutura do projeto é a seguinte:

/projetomackiac

/modulos             # Módulos reutilizáveis para recursos

/lambda              # Configuração de funções Lambda

/sqs                 # Configuração de filas SQS


│
/lambdas             # Código das funções Lambda

handler_query.py     # Código da função de consultas

handler_command.py   # Código da função de comandos


│
main.tf                  # Arquivo principal do Terraform

variaveis.tf             # Declaração de variáveis globais

outputs.tf               # Definição de outputs do projeto

README.md                # Documentação do projeto


3. Como Executar
3.1. Inicialize o Terraform
No diretório raiz do projeto, execute o seguinte comando para inicializar o Terraform:

terraform init



3.2. Valide o Plano
Valide as configurações e veja o que será criado:

terraform plan



3.3. Aplique o Código
Aplique o código para criar os recursos na AWS:

terraform apply



3.4. Outputs
Após a execução bem-sucedida, o Terraform exibirá os seguintes outputs:

URL da API criada no API Gateway.
Nome das funções Lambda.
URL da fila Amazon SQS.



4. Configuração de Variáveis
O arquivo variaveis.tf contém variáveis que podem ser personalizadas. Exemplos:

Variável	               Descrição	                             Valor Padrão
region	                 Região da AWS	                              us-east-1
lambda_runtime	      Ambiente de execução do Lambda	               python3.9

É possivel sobrescrever variáveis no momento da execução:

terraform apply -var="region=us-west-2"



5. Código das Funções Lambda
As funções Lambda estão localizadas no diretório /lambdas.

handler_query.py: Manipula consultas síncronas via API Gateway.
handler_command.py: Processa comandos recebidos pela fila Amazon SQS.

Para empacotar as funções, execute:
zip lambda_query.zip handler_query.py
zip lambda_command.zip handler_command.py



6. Fluxo Operacional
O fluxo operacional da solução é o seguinte:

O cliente faz uma requisição HTTP para o API Gateway.

Para consultas:
A API Gateway chama a função Lambda síncrona (handler_query).
O resultado é retornado para o cliente.

Para comandos:
O cliente envia mensagens para a fila Amazon SQS.
A função Lambda assíncrona (handler_command) processa as mensagens.



7. Diagrama da Arquitetura:
Cliente → API Gateway → Lambda (consultas)
         Cliente → SQS → Lambda (comandos)

8. Observações
Para destruir os recursos criados execute:
terraform destroy
