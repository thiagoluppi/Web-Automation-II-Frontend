# language: pt

Funcionalidade: Login
  Sendo um usuario cadastrado
  Quero acessar o sistema Rocklov
  Para que eu possa anunciar meus equipamentos musicais

  @login
  Cenario: Login do usuario
    Dado que acesso a pagina principal
    Quando submeto minhas credenciais com "thiago.luppi@icloud.com" e "pwd123"
    Entao sou redirecionado para o Dashboard

  Esquema do Cenario: Tentar logar
    Dado que acesso a pagina principal
    Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
    Entao vejo a mensagem de alerta: "<mensagem>"
    Exemplos:
      | email_input             | senha_input | mensagem                         |
      | thiago.luppi@icloud.com | abc123      | Usuário e/ou senha inválidos.    |
      | thiago.luppi@404.com    | pwd123      | Usuário e/ou senha inválidos.    |
      | thiago.luppi&icloud.com | pwd123      | Oops. Informe um email válido!   |
      |                         | pwd123      | Oops. Informe um email válido!   |
      | thiago.luppi@icloud.com |             | Oops. Informe sua senha secreta! |



# Cenario: Senha incorreta
#   Dado que acesso a pagina principal
#   Quando submeto minhas credenciais com senha incorreta
#   Entao vejo a mensagem de alerta