class UserRecipesFacade
  def self.get_recipes(uid)
    recipes = UserRecipesService.get_recipes(uid)
    if recipes
      recipes[:data].map do |recipe|
        UserRecipe.new(recipe)
      end
    end
  end
end