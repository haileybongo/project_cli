require_relative "recipe_cli/version"
require_relative "recipe_cli/cli"
require_relative "recipe_cli/api"
require_relative "recipe_cli/recipes"
require_relative "recipe_cli/recipe_info"
require_relative "recipe_cli/ingredients"
require_relative "recipe_cli/recipe"

require 'pry'
require 'httparty'


module RecipeCli
  class Error < StandardError; end
  # Your code goes here...
end
