class DiscoverResultsService
  def self.get_search_results(params)
    url = "https://babe_whats_for_dinner_be.herokuapp.com/recipes/findByIngredients?ingredients=" + self.parse(params)
    
    response = Faraday.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.parse(params)
    parsed = params.downcase.gsub(/\s+/, "").gsub(",","%2C")
  end
end