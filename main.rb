require "./question"
require "./player"

class Game

  def initialize
      @player1 =  Player.new
      @player2 =  Player.new
      @question =  Question.new
  end

  def start     
    while @player1.getter > 0 || @player2.getter > 0 do
      @result1 = @question.random_Question("Player 1:")
      @response1 = @player1.player_Answer("P1")
      if @result1 == @response1  
         puts "Player 1: YES! You are Correct!"
      else
         @player1.setter=(-1)
         puts "Player 1: Seriously? No!"
      end
          if @player1.getter == 0
             puts "Player 2 wins with a score of #{@player2.getter}/3"
             break
          else  
            puts "P1: #{@player1.getter}/3 vs P2: #{@player2.getter}/3"  
            puts "----- NEW TURN -----"  
            @result2 = @question.random_Question("Player 2:")
            @response2 = @player2.player_Answer("P2")
              if @result2 == @response2  
                 puts "Player 2: YES! You are Correct!"
              else
                 @player2.setter=(-1)
                 puts "Player 2: Seriously? No!"
              end
              if @player2.getter == 0
                 puts "Player 1 wins with a score of #{@player1.getter}/3"
                 break
              else  
                 puts "P1: #{@player1.getter}/3 vs P2: #{@player2.getter}/3"  
                 puts "----- NEW TURN -----"  
              end
          end
    end
    puts "----- GAMEOVER -----"
    puts "GoodBye!"
  end
end

game = Game.new
puts game
game.start
