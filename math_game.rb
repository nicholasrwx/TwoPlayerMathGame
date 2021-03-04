
# turns alternate between players
# new question per turn
# a question is generated for each turn randomly by picking a number between 1 && 20.
# answer correctly or lose a life
# start with 3 lives
# end of a turn, the game should output a new score
# announce winner
# show all scores

# Nouns [ player(s), Question(s)]
# Verbs [ alternate, randomize/question, answer, lose, announce/win, show/display message]

#Question
# this holds all the questions to choose from
# I think this should be a module that I include in a class
# I think this should be a class with state and methods bundled in one
#that includes the questions module

# Game (Players / Logic)
# generates two players, each has 3 lives, which are tracked by the player state
# it picks a random question when the players switch turns, between 1 and 20
# it formulates a response on if player answer is right or wrong, then switches players
# it displays a winning response with the correct player as the winner

#in order to initialize the GAME class
#we need to include the questions module
#we also need two players with 3 lives
#we need getter and setter methods to access the lives (private)
#we need getter and setter methods to compare question answers (public)
#the game class will contain the game loop
#the Game class should manage who the current player is since it handles the logic of the game
#game will have input output
#questions wont

#FLOW (wlak through conditions)

# Game starts 
# Game Creates 2 Players
# A Question is Given to Player 1
# Player 1 Gives a Response
# Game decides if the Respone is True or False
# if the response is True, Game Confirms response is True && Switches Players
# else, if response if False, A life is taken from Player 1
# Game checks to see if lives remaining is equal to 0 for player 1
# if lives equals 0, Game Ends, else, if Lives are still remaining, Game Switches Players

#Nouns
#1.Game
#  -starts
#  -creates 2 Players
#  -decides if response T || F (if true switch players, if false, remove life, check value, decide to switch or end)
#  -display true of false confirmation message
#  -Switch players 
#  -Remove life from current player
#  -Check if current players remaining lives = 0 
#  -End Game if current players life = 0 && Announce Winner
#2.Players
#  -gives response
#3.Question
#  -given

#Nouns - Classes // Vebs - Methods

class Question
  #Generate Random Question
  def random_Question(player)
    value1 = rand(1..20)
    value2 = rand(1..20)
    result = value1 + value2
    question = puts "#{player} what does #{value1} + #{value2} equal?"
    return result #return value to be used for comparison when called
  end

end
  
class Player
#get a response from a player
  def initialize
  
    @lives = 3

  end


  def player_Answer(p)
    print "#{p}>"
    response = $stdin.gets.chomp.to_i     
      return response
  end

  def getter
    @lives = @lives
  end

  def setter=(x)
    @lives = @lives + x 
  end

end

class Game

#start = initialize

  def initialize
    #display
    puts "initialize"


    #  -creates 2 Players
    @player1 = Player.new
    @player2 = Player.new
    @question = Question.new

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
