# language: pt
# encoding: utf-8

Dado("que acesso a pagina principal") do
  visit "/"
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, senha|
  # Aqui chamamos o passo "Dado que acesso a pagina de cadastro" e logo em seguida, usamos %{} para fazer uma string multiline e passar a datatable,
  # no passo "Quando submeto o seguinte formulario de cadastro:" e por fim usamos o passo "Dado que acesso a pagina principal" para voltar a pagina principal:

  # isso não foi feito pelo professor, foi feito apenas para que o cenario nao quebre, ao rodar todos os testes num regressivo.

  steps %{
    Dado que acesso a pagina de cadastro
    Quando submeto o seguinte formulario de cadastro:
      | nome                 | email                   | senha  |
      | Thiago Messias Luppi | thiago.luppi@icloud.com | pwd123 |
    Dado que acesso a pagina principal
  }

  find("input[placeholder='Seu e-email']").set email
  # aqui não precisaria colocar password entre aspas porque se trata de uma palavra. Se fossem duas, como acima, seria necessario.
  find("input[type='password']").set senha

  click_button "Entrar"
end
