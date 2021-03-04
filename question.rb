
class Question

  def random_Question(player)
      value1 = rand(1..20)
      value2 = rand(1..20)
      result = value1 + value2
      question = puts "#{player} what does #{value1} + #{value2} equal?"
      return result
  end

end