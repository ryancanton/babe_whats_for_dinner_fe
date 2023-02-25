class DiscoverResultsService
  def self.get_search_results(params)
    url = "https://babe-whats-for-dinner-be.herokuapp.com/recipes/findByIngredients?ingredients=" + self.parse(params)
    
    response = Faraday.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.parse(params)
    parsed = params.downcase.gsub(/\s+/, "").gsub(",","%2C")
  end
end