require 'sinatra/base'

class TicTacToe < Sinatra::Base
  get '/' do
    'Hello tic_tac_toe!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
