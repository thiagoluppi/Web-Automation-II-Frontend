# language: pt
# encoding: utf-8

@suite_cadastro
Funcionalidade: Cadastro
  Sendo um músico que possui equipamentos musicais
  Quero fazer o meu cadastro no RockLov
  Para que eu possa disponibilizá-los para locação

  @cadastro
  Cenario: Fazer cadastro
    Dado que acesso a pagina de cadastro
    Quando submeto o seguinte formulario de cadastro:
      | nome                 | email                   | senha  |
      | Thiago Messias Luppi | thiago.luppi@icloud.com | pwd123 |
    Entao sou redirecionado para o Dashboard

  @tentativa
  Esquema do Cenario: Tentativa de Cadastro
    Dado que acesso a pagina de cadastro
    Quando submeto o seguinte formulario de cadastro:
      | nome         | email         | senha         |
      | <nome_input> | <email_input> | <senha_input> |
    Entao vejo a mensagem de alerta: "<mensagem>"
    Exemplos:
      | nome_input           | email_input             | senha_input | mensagem                         |
      |                      | thiago.luppi@icloud.com | pwd123      | Oops. Informe seu nome completo! |
      | Thiago Messias Luppi |                         | pwd123      | Oops. Informe um email válido!   |
      | Thiago Messias Luppi | 123                     | pwd123      | Oops. Informe um email válido!   |
      | Thiago Messias Luppi | thiago.luppi@icloud.com |             | Oops. Informe sua senha secreta! |
