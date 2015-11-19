require 'pry'

class RPS

attr_accessor :player_score, :computer_score

  def initialize
    @player_score = 0
    @computer_score = 0

  end

def compare_scores(player_choice, computer_choice)

  if player_choice == computer_choice
    @player_score += 0
    @computer_score += 0

  elsif player_choice == "rock" && computer_choice == "scissors"
    @player_score += 1

  elsif player_choice == "scissors" && computer_choice == "paper"
    @player_score += 1

  elsif player_choice == "paper" && computer_choice == "rock"
    @player_score += 1

  else
    @computer_score += 1
  end
  # @player_choice = params[:player_choice]
  end
end
