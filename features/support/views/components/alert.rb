# language: pt
# encoding: utf-8

# Como o menu de login e um componente para login e para cadastro, entao
# ele não vai ficar nem em um, nem em outra, mas sim num componente a parte
# onde todos vao poder acessar.

class Alert
  include Capybara::DSL

  def dark
    return find(".alert-dark").text
  end
end
