# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  player_guess = params['guess'].to_i
  response = check_guess(player_guess)

  erb :index, locals: { answer: SECRET_NUMBER, player_guess: player_guess, response: response}
end
SECRET_NUMBER = rand(1..100)

def check_guess(player_guess)
  if player_guess == ''.to_i
    ''
  elsif player_guess == SECRET_NUMBER
    "Response: The secret number was #{SECRET_NUMBER}"
  elsif player_guess < SECRET_NUMBER
    if player_guess < SECRET_NUMBER - 5
      'Response: Much too low'
    else
      'Response: Too low'
    end
  elsif player_guess > SECRET_NUMBER
    if player_guess > SECRET_NUMBER + 5
      'Response: Much too high'
    else
      'Response: Too high'
    end
  end
end