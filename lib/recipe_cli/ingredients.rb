class RecipeCli::UserInput
  
  attr_accessor :key_words, :user_health, :user_cals
  

  
  def initialize(string, health = nil, calories = nil)
    @key_words = string
    @user_health = health 
    @user_cals = calories
  end
  
end

