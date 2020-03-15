require 'httparty'
require 'pry'

class RecipeCli::API 
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals
  
  @@all = []
  
  #def initialize(string, health = nil, calories = nil)
    #@key_words = string
    #@user_health = health 
    #@user_cals = calories
    #self.fetch 
    #@response = HTTParty.get(@url)
    #self.save_recipes 
  #end
  
  def fetch(instance)
    if instance.user_health != nil && instance.user_cals != nil
     @url = "https://api.edamam.com/search?q=#{instance.key_words}&health=#{instance.user_health}&calories=100-#{instance.user_cals.to_i}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
     @response = HTTParty.get(@url)
      save_recipes(instance)
    elsif instance.user_health != nil && instance.user_cals == nil 
      @url = "https://api.edamam.com/search?q=#{instance.key_words}&health=#{instance.user_health}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
      @response = HTTParty.get(@url)
      save_recipes(instance)
    elsif instance.user_health == nil && instance.user_cals != nil 
      @url = "https://api.edamam.com/search?q=#{instance.key_words}&calories=100-#{instance.user_cals.to_i}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
      @response = HTTParty.get(@url)
      save_recipes(instance)
    else 
      @url = "https://api.edamam.com/search?q=#{instance.key_words}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
      @response = HTTParty.get(@url)
      save_recipes(instance)
    end
    #binding.pry

  end 
  
  
  def save_recipes(instance)
    binding.pry 
    @response["hits"].each do |recipe|
      
      
      name = recipe["recipe"]["label"]
      link = recipe ["recipe"]["url"]
      recipe_yield = recipe["recipe"]["yield"]
      health_labels = recipe["recipe"]["healthLabels"]
      ingredientLines = recipe["recipe"]["ingredientLines"]
      calories = recipe["recipe"]["calories"]
  
      new_instance = RecipeCli::Recipe.new(name, link, recipe_yield, health_labels, ingredientLines, calories, instance)
      
      #@@all << new_instance
    end
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
  

  