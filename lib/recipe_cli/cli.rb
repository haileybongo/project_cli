class RecipeCli::CLI
  
  def call 
    puts "Hello! Welcome to Recipe Search. What ingredients would you like to search for?"
     key_words = ""
     key_words = gets.chomp!
     self.dietary_restrictions
     self.calorie_limit
     self.recipe_search
     self.recipe_choices
     self.search_or_quit
   end
   
     def dietary_restrictions
      
      puts "Do you have dietary restrictions you would like to consider? Enter Y or N"
      
      dietary = ""
      choice = ""
      restrictions = ""
      
      until dietary == "Y" || dietary == "N"
      
      dietary = gets.chomp!.upcase
      
        if dietary == "Y"
  
          until choice == "1" || choice == "2" || choice == "3" || choice == "4" || choice == "5"
             puts "Choose from restrictions below by entering number of choice:"
             puts "1. Vegetarian"
             puts "2. Vegan"
             puts "3. Tree Nut Free"
             puts "4. Peanut Free"
             puts "5. Low Sugar"
            choice = gets.chomp!
        
          case choice
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
              puts "Please choose 1-5 from list."
            end
          end
        elsif dietary == "N"
        restrictions = nil 
      else
        puts "Please choose Y or N."
        end
      end
    end
  
    def calorie_limit
    
      puts "Would you like to enter a calorie limit per meal? Enter Y or N"
    
      choice = ""
      
      until choice == "Y" || choice == "N"
      
      choice = gets.chomp!.upcase
        
        if choice == "Y"
          puts "Please enter calorie limit"
          kcal = gets.chomp!.to_i 
        elsif choice == "N" 
          kcal = nil
        else 
          puts "Please choose Y or N."
        end 
      end
    end
    
    def recipe_search
        
      new_search = RecipeCli::UserInput.new(key_words, restrictions, kcal)
      RecipeCli::API.new.fetch(new_search)
      
      puts"Select Recipe From Available List"
      
      user_selection = -1
      
      recipe_list = []
      recipe_list =  RecipeCli::Recipe.all.select {|recipe| recipe.ingredients == new_search}
      
      
      until user_selection.to_i >= 0 && user_selection.to_i <= recipe_list.size - 1
  
      
      recipe_list.each.with_index(1) do |recipe, index|
        name = recipe.name 
        puts "#{index}. #{name}" 
        end
      
       user_selection = (gets.chomp!.to_i)-1
        
      end
    end
  
    def recipe_choices
      
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
            puts "#{recipe_list[user_selection].link}"  
            puts " "
            puts " "
        when "2"
           recipe_list[user_selection].ingredientLines.each do |ingredient|
            puts "#{ingredient}"
          end
            puts " "
            puts " "
        when "3"
            recipe_list[user_selection].health_labels.each do |health|
            puts "#{health}"
          end
            puts " "
            puts " "
        when "4"
           puts "#{recipe_list[user_selection].calories.to_i}"
            puts " "
            puts " "
        when "5"
           puts "#{recipe_list[user_selection].recipe_yield}"
            puts " "
            puts " "
        else 
          puts " "
          puts " "
        end
      end
  end

    def search_or_quit
      
        choice = ""
        
        
        puts "Would you like to search again or quit? Enter search or quit."
      
      until choice == "quit"
      
      choice = gets.chomp!
      
        case choice 
          when "search"
            call
          when "quit"
            exit  
          when choice != "search" || choice !="quit" 
          puts "Sorry, I don't understand that."
        end
      end
     end
   end
   
   
 end

