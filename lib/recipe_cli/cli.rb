class RecipeCli::CLI
  
  def call 
    puts "Hello! Welcome to Recipe Search. What ingredients would you like to search for?"
     food = ""
     food = gets.chomp!
    
    puts "Do you have dietary restrictions you would like to consider? Enter Y or N"
    
    dietary = ""
    dietary = gets.chomp!
     if dietary = "Y"
      puts "Choose from restrictions below:"
      puts "1. Vegetarian"
      puts "2. Vegan"
      puts "3. Tree Nut Free"
      puts "4. Peanut Free"
      puts "5. No Soy"
      puts "6. Dairy Free"
      puts "7. Gluten Free"
      
      restrictions = gets.chomp!
   
  end
  

  
end