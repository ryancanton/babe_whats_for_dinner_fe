class RecipeResultsFacade
    def self.get_recipe(id)
      data = RecipeResultsService.get_recipe_info(id)
      Recipe.new(data)
    end
  end