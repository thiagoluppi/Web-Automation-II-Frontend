# language: pt
# encoding: utf-8

Dado("que acesso a pagina principal") do
  @login_page.open
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, password|
  @login_page.open
  @login_page.with(email, password)
end
