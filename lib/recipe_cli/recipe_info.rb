class RecipeCli::RecipeInfo
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals
    

  
  def self.recipe_facts(user_selection)
   choice =  recipe.all[user_selection]
   
   @name = choice.name
   @link = choice.link
   @recipe_yield = choice.recipe_yield
    
    
    #@name = RecipeCli::API.all[user_selection]["recipe"]["label"]
    #@link = RecipeCli::API.all[user_selection]["recipe"]["url"]
    #@recipe_yield = RecipeCli::API.all[user_selection]["recipe"]["yield"]
    #@health_labels = RecipeCli::API.all[user_selection]["recipe"]["healthLabels"]
    #@ingredientLines = RecipeCli::API.all[user_selection]["recipe"]["ingredientLines"]
    #@calories = RecipeCli::API.all[user_selection]["recipe"]["calories"]
    binding.pry
  end
 
 
  def self.link 
    puts "#{@link}" 
    puts " "
    puts " "
  end
  
  def self.ingredients
     @ingredientLines.each do |ingredient|
      puts "#{ingredient}"
      end
      puts " "
      puts " "
  end
  
  def self.health 
      @health_labels.each do |label|
      puts "#{label}"
      end
      puts " "
      puts " "
    end
    
  def self.calories
      puts "#{@calories} calories"
      puts " "
      puts " "
    end
    
    def self.servings
        puts "#{@recipe_yield} servings"
        puts " "
        puts " "
      end
      
  end
      
   #response = HTTParty.get(@url)
  
    #@name = response["hits"][user_selection]["recipe"]["label"]
    #@link = response["hits"][user_selection]["recipe"]["url"]
    #@recipe_yield = response["hits"][user_selection]["recipe"]["yield"]
    #@health_labels = response["hits"][user_selection]["recipe"]["healthLabels"]
    #@ingredientLines = response["hits"][user_selection]["recipe"]["ingredientLines"]
    #@calories = response["hits"][user_selection]["recipe"]["calories"]
    #binding.pry
    