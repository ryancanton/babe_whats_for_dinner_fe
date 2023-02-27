class Recipe
  attr_reader :id, :title, :ready_in_minutes, :image, :summary, :instructions, :extended_ingredients

  def initialize(data)

    @id = data[:attributes][:id]
    @title = data[:attributes][:title]
    @ready_in_minutes = data[:attributes][:ready_in_minutes]
    @image = data[:attributes][:image]
    @summary = data[:attributes][:summary]
    @instructions = data[:attributes][:instructions]

    @extended_ingredients = Recipe.extended_ingredients(data[:attributes][:ingredients])
    
  end

  def self.extended_ingredients(data)
    data.map do |ingr|
      {
        name: ingr[:name],
        amount: ingr[:amount],
        unit: ingr[:unit]
      }
    end
  end
end
