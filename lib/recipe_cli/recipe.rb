class RecipeCli::Recipe 
  
  attr_accessor :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :user_input
  
  @@all = []
  
  def initialize (name, link, recipe_yield, health_labels, ingredientLines, kcal, instance)
    @name = name
    @link = link 
    @recipe_yield = recipe_yield
    @health_labels = health_labels
    @ingredientLines = ingredientLines
    @calories = kcal 
    @user_input = instance 
    @@all << self
  end
    
    
        
  def self.all 
    @@all
  end
    
end
  
