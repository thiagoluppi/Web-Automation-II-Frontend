# language: pt
# encoding: utf-8

Dado("que acesso a pagina de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulario de cadastro:") do |table|
  # Nesse módulo só vamos utilizar um unico registro na tabela,
  # por isso vamos usar o .first que trará direto o primeiro item do array.
  # Criamos a var "user" e convertemos a tabela num array do ruby:
  # user = table.hashes.first => users = table.hashes[0] (mesma coisa!)
  user = table.hashes.first

  # apaga o usuario no banco:
  Mongodb.new.remove_user(user[:email])
  # Mongodb.new.remove_user("thiago.luppi@icloud.com")

  @signup_page.create_user(user)
end
