require './Questions'


class Game 
  def initialize()
   
   @lives_player1 = 3
   @lives_player2 = 3
   @turn = 1
  end

 def start_game
  puts "Started My Game"
  question = Question.new
  puts "Player#{@turn} #{@player1}: #{question.question}"
  puts "> "
  answer = gets.chomp
  if answer.to_i == question.answer
    puts "You are correct" 
  else 
# wrong answer, so we need to reduce lives
    puts "You are not correct" 
    if @turn == 1
      # reduce life for player 1
      @lives_player1 -= 1
      puts "P1: #{@lives_player1}/3 vs P2: #{@lives_player2}/3"
    else 
      # reduce life for player 2
      @lives_player2 -= 1
      puts "P1: #{@lives_player1}/3 vs P2: #{@lives_player2}/3"
    end
  end
  
  # check if the game is over
  
  if @lives_player1 == 0 || @lives_player2 == 0
    puts "---GAME OVER---"
  else 
    @turn = @turn == 1 ? 2 : 1
    puts "Now the turn is #{@turn}"
    start_game()
  end
end 
  
end