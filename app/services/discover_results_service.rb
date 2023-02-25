class DiscoverResultsService
  def self.get_search_results(params)
    url = "http://babe-whats-for-dinner-be.herokuapp.com/api/v1/recipes/findByIngredients?ingredients=" + self.parse(params)
    
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.parse(params)
    parsed = params.downcase.gsub(/\s+/, "")
  end
end