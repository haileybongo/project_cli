class RecipeCli::API 
  
  attr_accessor :response
  
  
  def fetch(instance)
    if instance.user_health != nil && instance.user_cals != nil
     url = "https://api.edamam.com/search?q=#{instance.key_words}&health=#{instance.user_health}&calories=100-#{instance.user_cals.to_i}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
     @response = HTTParty.get(url)
      save_recipes(instance)
    elsif instance.user_health != nil && instance.user_cals == nil 
      url = "https://api.edamam.com/search?q=#{instance.key_words}&health=#{instance.user_health}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
      @response = HTTParty.get(url)
      save_recipes(instance)
    elsif instance.user_health == nil && instance.user_cals != nil 
      url = "https://api.edamam.com/search?q=#{instance.key_words}&calories=100-#{instance.user_cals.to_i}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
      @response = HTTParty.get(url)
      save_recipes(instance)
    else 
      url = "https://api.edamam.com/search?q=#{instance.key_words}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
      @response = HTTParty.get(url)
      save_recipes(instance)
    end
  end 
  
  
  def save_recipes(instance)    
    @response["hits"].each do |recipe|
      
      
      name = recipe["recipe"]["label"]
      link = recipe ["recipe"]["url"]
      recipe_yield = recipe["recipe"]["yield"]
      health_labels = recipe["recipe"]["healthLabels"]
      ingredientLines = recipe["recipe"]["ingredientLines"]
      calories = (recipe["recipe"]["calories"])/(recipe["recipe"]["yield"])
  
      new_instance = RecipeCli::Recipe.new(name, link, recipe_yield, health_labels, ingredientLines, calories, instance)
      
    end
  end
end
    
    


  