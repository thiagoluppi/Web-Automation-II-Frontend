# language: pt
# encoding: utf-8

Dado("que estou logado como {string} e {string}") do |email, password|
  @email = email
  visit "/"

  find("input[placeholder='Seu e-email']").set email
  # aqui não precisaria colocar password entre aspas porque se trata de uma palavra. Se fossem duas, como acima, seria necessario.
  find("input[type='password']").set password

  click_button "Entrar"
end

Dado("que acesso o formulario de cadastro de anuncios") do
  # click_button "Criar anúncio"
  find(".btn").click
  # Checkpoint para garantir que estou no lugar certo.
  expect(page).to have_css "#equipoForm"
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash
  Mongodb.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadatro desse item") do
  find("input[placeholder$=equipamento]").set @anuncio[:nome]

  el_categoria = find("#category")
  # Busca dentro do elemento "categoria" pelo texto que vem do feature e depois invoca o método select_option para selecionar a opção do combo-box.
  # o "option" é porque as opções dentro de um combo-box no css é option.
  el_categoria.find("option", text: @anuncio[:categoria]).select_option

  find("#price").set @anuncio[:preco]

  # o comando "Dir.pwd" é para dar o caminho até meu projeto. É como ir até o terminal e digitar "pwd":
  # ✗ pwd
  # /Users/thiagomessiasluppi/Documents/GitHub/Web-Automation-I-Frontend
  # então o comando abaixo pega algo assim:
  # /Users/thiagomessiasluppi/Documents/GitHub/Web-Automation-I-Frontend/features/support/fixtures/images ==> fender-sb.jpg
  thumb = Dir.pwd + "/features/support/fixtures/images/#{@anuncio[:thumb]}"
  log thumb

  # Ao executar dá um erro dizendo que o capybara não encontrou o elemento
  # Isso se dá porque o elemento está oculto
  # Com o comando abaixo o capybara encontra até mesmo os elementos invisiveis.
  find("#thumbnail input[type=file]", visible: false).set thumb

  # botão Cadastrar: ==> click_button "Cadastrar"
  find(".btn").click
end

Entao("devo ver esse item no meu Dashboard") do
  anuncios = find(".equipo-list")
  expect(anuncios).to have_content @anuncio[:nome]
  expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end
