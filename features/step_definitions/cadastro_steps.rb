# language: pt
# encoding: utf-8

Dado("que acesso a pagina de cadastro") do
  visit "/signup"
end

Quando("submeto o seguinte formulario de cadastro:") do |table|
  # Nesse módulo só vamos utilizar um unico registro na tabela,
  # por isso vamos usar o .first que trará direto o primeiro item do array.
  # Criamos a var "users" e convertemos a tabela num array do ruby:
  # users = table.hashes.first => users = table.hashes[0] (mesma coisa!)
  users = table.hashes.first

  # apaga o usuario no banco:
  Mongodb.new.remove_user(users[:email])
  # Mongodb.new.remove_user("thiago.luppi@icloud.com")

  # trocamos a string pelo item do array:
  # | nome                  | email                   | senha |
  # | Thiago Messias Luppi  | thiago.luppi@icloud.com | pwd123|
  find("#fullName").set users[:nome]
  # find("#fullName").set "Thiago Messias Luppi"

  find("#email").set users[:email]
  # find("#email").set "thiago.luppi@icloud.com"

  find("#password").set users[:senha]
  # find("#password").set "pwd123"

  click_button "Cadastrar"
end
