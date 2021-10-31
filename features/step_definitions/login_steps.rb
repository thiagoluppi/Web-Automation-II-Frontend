# language: pt
# encoding: utf-8

Dado("que acesso a pagina principal") do
  visit "/"
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, senha|
  login_page = LoginPage.new
  login_page.abrir
  login_page.campo_email.set email
  login_page.campo_senha.set senha
  login_page.botao_entrar
end
