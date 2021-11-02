# language: pt
# encoding: utf-8

Entao("sou redirecionado para o Dashboard") do
  expect(@dash_page.on_dash?).to be true
end

Entao("vejo a mensagem de alerta: {string}") do |alert_message|
  expect(@alert.dark).to eql alert_message
end
