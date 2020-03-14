require 'httparty'
require 'pry'

class RecipeCli::API 
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response
  
  def fetch(string, health = nil, calories = nil)
    
    if health != nil && calories != nil
      url = "https://api.edamam.com/search?q=#{string}&health=#{health}&calories=100-#{calories.to_i}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    elsif health != nil && calories == nil 
      url = "https://api.edamam.com/search?q=#{string}&health=#{health}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    elsif health == nil && calories != nil 
      url = "https://api.edamam.com/search?q=#{string}&calories=100-#{calories.to_i}app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    else 
      url = "https://api.edamam.com/search?q=#{string}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    end
  
    @response = HTTParty.get(url)
  end 
  
  def select_recipe
    
    puts"Select Recipe From Available List"
    
    @response["hits"].each.with_index(1) do |recipe, index|
      name = recipe["recipe"]["label"] 
      puts "#{index}. #{name}" 
    end
    
    
    user_selection = (gets.chomp!.to_i)-1
    
    recipe_facts(user_selection)
  
  end
  
  
  def self.recipe_options
    
    choice = ""
    
    while choice != "q"
    
    puts "Would you like to view more information or save your recipe? Select from choices below or press q to quit"
    puts "1. Save recipe to your recipe book"
    puts "2. See recipe link"
    puts "3. See recipe ingredient list"
    puts "4. See recipe health labels"
    puts "5. see recipe calories"
    puts "6. See recipe servings yield"
    
    choice = gets.strip.to_i 
  
    case choice 
      when "1"
        RecipeCli::Recipes.new(name, link, recipe_yield, health_labels, ingredientLines, calories)
      when "2"
        puts "#{link}" 
      when "3"
        @ingredientLines.each do |ingredient|
          puts "#{ingredient}"
        end
      when "4"
        @health_labels.each do |label|
          puts "#{label}"
        end
      when "5"
        puts "#{@calories} calories"
      when "6"
        puts "#{@recipe_yield} servings"
      else 
        puts "Please select a number from the list of options or press q to quit"
      end
  end
  
end
  
  def recipe_facts(user_selection)
    @name = response["hits"][user_selection]["recipe"]["label"]
    @link = response["hits"][user_selection]["recipe"]["url"]
    @recipe_yield = response["hits"][user_selection]["recipe"]["yield"]
    @health_labels = response["hits"][user_selection]["recipe"]["healthLabels"]
    @ingredientLines = response["hits"][user_selection]["recipe"]["ingredientLines"]
    @calories = response["hits"][user_selection]["recipe"]["calories"]
    #binding.pry
  end
    
    
end
    
    


  #gets search term = https://api.edamam.com/search?q= pasta,tomato,sausage &app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797
  
  #./bin/recipe-project
  #response["hits"][0]
  #response["hits"][0]["recipe"]["yield"]
  # link with health label = https://api.edamam.com/search?q=eggplant&health=peanut-free&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797
  #link with health & calories = https://api.edamam.com/search?q=eggplant&health=peanut-free&calories=100-600&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797
  
  
    #name = "label"
    #link = "url"
    #yield = "yield"
    #health_labels = "healthLabels"
    #ingredientLines = "ingredientLines"
    #calories = "calories"
  

  