# language: pt
# encoding: utf-8

require "mongo"

# Faz com que o log do banco saia no arquivo e não no terminal.u
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class Mongodb
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new("mongodb://127.0.0.1:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    # esse :users é porque lá no banco do Mongo tem essa collection no banco do Papito: rocklob > Collections (1) > users (Robo 3T)
    @users.delete_many({ email: email })
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, email)
    user_id = get_user(email)
    @equipos.delete_many({ name: name, user: user_id })
  end
end
