class RecipeCli::CLI
  
  def call 
    puts "Hello! Welcome to Recipe Search. What ingredients would you like to search for?"
     food = ""
     food = gets.chomp!
    
    puts "Do you have dietary restrictions you would like to consider? Enter Y or N"
    
    dietary = ""
    dietary = gets.chomp!.upcase
     if dietary == "Y"
      puts "Choose from restrictions below by entering number of choice:"
      puts "1. Vegetarian"
      puts "2. Vegan"
      puts "3. Tree Nut Free"
      puts "4. Peanut Free"
      puts "5. Low Sugar"

      
      restrictions = gets.chomp!
      
      case restrictions
        when "1" 
          restrictions = "vegetarian"
        when "2"
          restrictions = "vegan"
        when "3"
          restrictions = "tree-nut-free"
        when "4"
          restrictions = "peanut-free"
        when "5"
          restrictions = "sugar-conscious"
        else 
          "I don't understand that input. Moving on without restrictions"
          restrictions = nil
        end
     else
        restrictions = nil
    end
    
    puts "Would you like to enter a calorie limit per meal? Enter Y or N"
    
    kcal = ""
    kcal = gets.chomp!.upcase
      if kcal == "Y"
        puts "Please enter calorie limit"
        kcal = gets.chomp!.to_i 
      else 
        kcal = nil
      end 
      
    new_search = RecipeCli::API.new(food, restrictions, kcal)
    
    puts"Select Recipe From Available List"
    
    RecipeCli::Recipes.select_recipe

    choice = ""
    
    until choice == "q"
    
    puts "Would you like to view more information? Select from choices below or press q to quit"
    puts "1. See recipe link"
    puts "2. See recipe ingredient list"
    puts "3. See recipe health labels"
    puts "4. see recipe calories"
    puts "5. See recipe servings yield"
    
    choice = gets.strip
  
    case choice 
      when "1"
          RecipeCli::RecipeInfo.link 
      when "2"
          RecipeCli::RecipeInfo.ingredients
      when "3"
        RecipeCli::RecipeInfo.health
      when "4"
        RecipeCli::RecipeInfo.calories
      when "5"
        RecipeCli::RecipeInfo.servings
      else 
        puts "Please select a number from the list of options or press q to quit"
        puts " "
        puts " "
      end
  end
    
    choice = ""
    
    until choice == "quit"
    
    puts "Would you like to search again or quit? Enter search or quit."

    choice = gets.chomp!
    
      case choice 
        when "search"
          call
        when choice != "search" || choice !="quit" 
        puts "Sorry, I don't understand that."
      end
    end
 end
end
