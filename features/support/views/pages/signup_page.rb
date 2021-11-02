# language: pt
# encoding: utf-8

class SignupPage
  include Capybara::DSL

  def open
    visit "/signup"
  end

  def create(user)
    # trocamos a string pelo item do array:
    # | nome                  | email                   | senha |
    # | Thiago Messias Luppi  | thiago.luppi@icloud.com | pwd123|
    find("#fullName").set user[:nome]
    # find("#fullName").set "Thiago Messias Luppi"

    find("#email").set user[:email]
    # find("#email").set "thiago.luppi@icloud.com"

    find("#password").set user[:senha]
    # find("#password").set "pwd123"

    click_button "Cadastrar"
  end
end
