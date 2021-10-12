require './question'
require './player'

class Game
  total_lives = 3

  def initialize
    puts "Welcome to the 2-Player math game! You will each start with 3 lives."
    puts "Please enter your name, PLAYER 1:"
    @player1 = Player.new(gets.chomp)
    puts "Please enter your name, PLAYER 1:"
    @player2 = Player.new(gets.chomp)
    puts "Okay, #{@player1.name} and #{@player2.name}, let's begin!"
    @player1.turn = true
  end

  def question
    math_question = Question.new
    @question = math_question.question
    @answer = math_question.answer

    if @player1.turn
      puts "#{@player1.name}: " + @question
    else
      puts "#{@player2.name}: " + @question
    end
  end

  def check_answer
    print '>'
    player_ans = gets.chomp.to_i
    message = player_ans == @answer ? "YES! You are correct." : "Seriously? No!"

    current_player = @player1.turn ? @player1 : @player2
    opponent_player = current_player == @player1 ? @player2 : @player1

    puts "#{current_player.name}: #{message}"
    
    if player_ans != @answer
      current_player.life -= 1
      win?
    end
    score

    current_player.turn = false 
    opponent_player.turn = true
  end 

  def score 
    puts "P1: #{@player1.life} / #{total_lives} vs P2: #{@player2.life} / #{total_lives}"
  end

  def turn 
    puts "----NEW TURN----"
    question
    check_answer
  end

  def win?
    if @player1.life > 0 && @player2.life > 0
      turn
    else
      if @player1.life == 0
        puts "#{@player2.name} wins with a score of #{@player2.life} / #{total_lives}"
      elsif @player2.life == 0
        puts "#{@player1.name} wins with a score of #{@player1.life} / #{total_lives}"
      end
      puts "----GAME OVER----"
      puts "Good bye!"
    end
  end

end