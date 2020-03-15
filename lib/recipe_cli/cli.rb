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
      puts "5. No Soy"
      puts "6. Dairy Free"
      puts "7. Gluten Free"
      
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
          restrictions = "soy-free"
        when "6"
          restrictions =  "dairy-free"
        when "7"
          restrictions = "gluten-free"
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
    new_search.fetch
    new_search.select_recipe
    new_search.recipe_options
    
    
    choice = ""
    
    while choice!= "quit"
    
    puts "Would you like to search again or quit? Enter search or quit."

    choice = gets.chomp!
    
    case choice 
      when "search"
        call
      else 
      puts "Sorry, I don't understand that."
    end
  end

  
  end
  
end