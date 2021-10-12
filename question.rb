class Question
  attr_reader :question, :answer

  def initialize
    first_number = rand(1..20)
    second_number = rand(1..20)
    @question = "What does #{first_number} plus #{second_number} equal?"
    @answer = first_number + second_number
  end 

end