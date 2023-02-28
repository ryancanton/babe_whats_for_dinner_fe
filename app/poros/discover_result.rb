class DiscoverResult

  attr_reader :id,
              :img,
              :name,
              :missing_ingr,
              :missing_ingr_count

  def initialize(data)
    @id = data[:id]
    @img = data[:attributes][:image]
    @name = data[:attributes][:name]
    @missing_ingr = data[:attributes][:missing_ingr]
    @missing_ingr_count = data[:attributes][:missing_ingr_count]
  end
end