class RecipeCli::Recipes
  
    attr_accessor :chosen_recipe, :name, :link, :recipe_yield, :ingredientLines, :health_labels, :calories, :response, :url, :key_words, :user_health, :user_cals

  
  def self.select_recipe
    
    #response = HTTParty.get(@url)
    
    RecipeCli::API.all.each.with_index(1) do |recipe, index|
      name = recipe["recipe"]["label"] 
      puts "#{index}. #{name}" 
    end
    
   
    
    user_selection = (gets.chomp!.to_i)-1
    # binding.pry
    
    if user_selection >= 0 && user_selection <=9
     RecipeCli::RecipeInfo.recipe_facts(user_selection.to_i)
    else 
      select_recipe
    end
  
  end
  
end