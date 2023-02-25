class RecipeResultsFacade
    def self.get_recipe(id)
      data = RecipeResultsService.get_recipe_info(id)[:data]
      binding.pry
      Recipe.new(data)
    end
  end