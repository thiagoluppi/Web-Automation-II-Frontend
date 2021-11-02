# language: pt
# encoding: utf-8

@anuncios
Funcionalidade: Cadastro de Anuncios
  Sendo um usuario cadastrado no Rocklov que possui equipamentos musicais
  Quero cadastrar meus equipamentos
  Para que eu possa disponibilizar para aluguel

  # Diferente da tabela do arquivo cadastro.feature, essa tabela é de chave e valor:
  # thumb é a chave e o valor é fender-sb.jpg e por ai vai...
  # Na outra tabela temos colunas e varios valores diferentes, aqui temos apenas um único registro.
  @novo_equipo
  Cenario: Novo equipo
    Dado que estou logado como "thiago.luppi@icloud.com" e "pwd123"
      E que acesso o formulario de cadastro de anuncios
      E que eu tenho o seguinte equipamento:
      | thumb     | fender-sb.jpg |
      | nome      | Fender Strato |
      | categoria | Cordas        |
      | preco     | 200           |
    Quando submeto o cadastro desse item
    Entao devo ver esse item no meu Dashboard