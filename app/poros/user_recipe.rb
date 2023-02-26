class UserRecipe
  def initialize(data)
    @uid = data[:attributes][:uid]
    @name = data[:attributes][:recipe_name]
    @recipe_id = data[:attributes][:recipe_id]
  end
end