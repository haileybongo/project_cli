class RecipeCli::Ingredients
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals, :inredients 
  
  @@all = []
  
  def initialize(string, health = nil, calories = nil)
    @key_words = string
    @user_health = health 
    @user_cals = calories
    @@all << self 
  end
  
end

