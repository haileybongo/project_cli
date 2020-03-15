require 'httparty'
require 'pry'

class RecipeCli::API 
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals
  
  
  @@all = []
  
  def initialize(string, health = nil, calories = nil)
    @key_words = string
    @user_health = health 
    @user_cals = calories
    @@all << self 
  end
  
  def all 
    @@all
  end
    
  
  def fetch
    if @user_health != nil && @user_cals != nil
     self.url = "https://api.edamam.com/search?q=#{@key_words}&health=#{@user_health}&calories=100-#{@user_cals.to_i}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    elsif @user_health != nil && @user_cals == nil 
      self.url = "https://api.edamam.com/search?q=#{@key_words}&health=#{@user_health}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    elsif @user_health == nil && @user_cals != nil 
      self.url = "https://api.edamam.com/search?q=#{@key_words}&calories=100-#{@user_cals.to_i}app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    else 
      self.url = "https://api.edamam.com/search?q=#{@key_words}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    end
    #binding.pry

  end 
  
  def select_recipe
    
    puts"Select Recipe From Available List"
    
    path = @url 
   
    
    response = HTTParty.get(path)
    
   
    response["hits"].each.with_index(1) do |recipe, index|
      name = recipe["recipe"]["label"] 
      puts "#{index}. #{name}" 
    end
    
    
    user_selection = (gets.chomp!.to_i)-1
     binding.pry
    
    if user_selection >= 0 && user_selection <=9
     recipe_facts(user_selection)
    else 
      select_recipe
    end
  
  end
  
  
  def recipe_options
    
    choice = ""
    
    while choice != "q"
    
    puts "Would you like to view more information? Select from choices below or press q to quit"
    puts "1. See recipe link"
    puts "2. See recipe ingredient list"
    puts "3. See recipe health labels"
    puts "4. see recipe calories"
    puts "5. See recipe servings yield"
    
    choice = gets.strip
  
    case choice 
      when "1"
         puts "#{self.link}" 
         puts " "
         puts " "
      when "2"
        @ingredientLines.each do |ingredient|
          puts "#{ingredient}"
        end
        puts " "
        puts " "
      when "3"
        @health_labels.each do |label|
          puts "#{label}"
        end
        puts " "
        puts " "
      when "4"
        puts "#{@calories} calories"
        puts " "
        puts " "
      when "5"
        puts "#{@recipe_yield} servings"
        puts " "
        puts " "
      else 
        puts "Please select a number from the list of options or press q to quit"
        puts " "
        puts " "
      end
  end
  
end
  
  def recipe_facts(user_selection)
    
    response = HTTParty.get(@url)
    
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
  

  