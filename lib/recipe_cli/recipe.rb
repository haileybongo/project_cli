class RecipeCli::Recipe 
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals, :ingredients
  
  @@all = []
  
  def initialize (name, link, recipe_yield, health_labels, ingredientLines, kcal, instance)
    @name = name
    @link = link 
    @recipe_yield = recipe_yield
    @health_labels = health_labels
    @ingredientLines = ingredientLines
    @calories = kcal 
    @ingredients = instance 
    @@all << self
  end
    
    
        
  def self.all 
    @@all
  end
    
end
  
