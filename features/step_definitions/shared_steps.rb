# language: pt
# encoding: utf-8

Entao("sou redirecionado para o Dashboard") do
  expect(page).to have_css ".dashboard"
end

Entao("vejo a mensagem de alerta: {string}") do |alert_message|
  expect(@alert.dark).to eql alert_message
end
