require "sinatra"
require 'pry'


use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}


get '/index' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
    session[:player_score] = 0
    session[:computer_score] = 0
  else
    session[:visit_count] += 1

  end
  erb :index
end


post '/index' do
  # Get the player's choice
  session[:player_choice] = params[:player_choice]
  ComputerChoice = ["rock", "paper", "scissors"]
  session[:computer_choice] = ComputerChoice.sample

  computer_score = session[:computer_score]
  player_score = session[:player_score]

    if session[:player_choice] == session[:computer_choice]
      player_score += 0
      computer_score += 0

    elsif session[:player_choice] == "rock" && session[:computer_choice] == "scissors"
      player_score += 1

    elsif session[:player_choice] == "scissors" && session[:computer_choice] == "paper"
      player_score += 1

    elsif session[:player_choice] == "paper" && session[:computer_choice] == "rock"
      player_score += 1

    else
      computer_score += 1
    end
session[:computer_score] = computer_score
session[:player_score] = player_score
  redirect '/index'
end


get '/reset' do
  session.clear
  redirect '/index'
end
