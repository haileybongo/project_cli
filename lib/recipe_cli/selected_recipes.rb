class RecipeCli::Recipes
  
  attr_accessor :chosen_recipe, :name, :link, :recipe_yeild, :health_labels, :ingredientLines, :calories
  
  @@all = []
  
  def initialize(name, link, recipe_yield, health_labels, ingredientLines, calories)
    @chosen_recipe = {}
    @chosen_recipe = {
      :name => name,
      :link => link,
      :recipe_yield => recipe_yield,
      :health_labels => health_labels,
      :ingredientLines => ingredientLines,
      :calories => calories
    }
    
    @@all << @chosen_recipe
  end
  
  def self.all
    @@all
  end
  
  def self.saved_names
    @@all.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe}"
    end
  end
  
end

