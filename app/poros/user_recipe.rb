class UserRecipe
  attr_reader :uid,
              :name,
              :recipe_id
  def initialize(data)
    @uid = data[:attributes][:uid]
    @name = data[:attributes][:recipe_name]
    @recipe_id = data[:attributes][:recipe_id]
  end
end