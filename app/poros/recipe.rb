class Recipe
  attr_reader :id, :title, :ready_in_minutes, :image, :summary, :instructions, :extended_ingredients

  def initialize(data)
    require 'pry'; binding.pry
    @id = data[:id]
    @title = data[:title]
    @ready_in_minutes = data[:readyInMinutes]
    @image = data[:image]
    @summary = data[:summary]
    @instructions = data[:instructions]
    @extended_ingredients = Recipe.extended_ingredients(data[:attributes][:ingredients])
    
  end

  def self.extended_ingredients(data)
    require 'pry'; binding.pry
    data.map do |ingr|
      {
        name: ingr[:name],
        amount: ingr[:amount],
        unit: ingr[:unit]
      }
    end
  end
end
