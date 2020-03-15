class RecipeCli::Recipe 
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals
  
  def initialize (url, label, recipe_yield, health_label, ingredientLines, instance)
    @name = 
    @link = 
    @recipe_yield = 
    @ingredientLines = 
    @health_labels = 
    @@all << self
  end
    
    
        
  def self.all 
    @@all
  end
    
    
  end