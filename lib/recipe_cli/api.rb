require 'httparty'
require 'pry'

class RecipeCli::API 
  
  attr_accessor :chosen_recipe, 
  
  def fetch(string, health = nil, calories = nil)
    
    if health && calories
      url = "https://api.edamam.com/search?q=#{string}&health=#{health}&calories=100-#{calories.to_i}app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    elsif health != nil && calories == nil 
      url = "https://api.edamam.com/search?q=#{string}&health=#{health}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    elsif health == nil && calories != nil 
      url = "https://api.edamam.com/search?q=#{string}&calories=100-#{calories.to_i}app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    else 
     url = "https://api.edamam.com/search?q=#{string}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    end
  
    response = HTTParty.get(url)
    #binding.pry 
    
    puts"Select Recipe From Available List"
    
    response["hits"].each.with_index(1) do |recipe, index|
      name = recipe["recipe"]["label"] 
      puts "#{index}. #{name}" 
    end
    
    user_selection = (gets.chomp!.to_i)-1
    
    name = response["hits"][user_selection]["recipe"]["label"]
    link = response["hits"][user_selection]["url"]["label"]
    recipe_yeild = response["hits"][user_selection]["yield"]["label"]
    health_labels = response["hits"][user_selection]["healthLabels"]["label"]
    ingredientLines = response["hits"][user_selection]["ingredientLines"]["label"]
    calories = response["hits"][user_selection]["calories"]["label"]
    
    

  
    
  end
  
  def self.get_ingredients
    puts @chosen_recipe["ingredientLines"]
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
  

  