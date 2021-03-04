  
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
  