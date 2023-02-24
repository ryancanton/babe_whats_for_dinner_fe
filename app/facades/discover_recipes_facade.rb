class DiscoverRecipesFacade
  def self.get_results(params)
    data = DiscoverResultsService.get_search_results(params)
    data.map do |result|
      DiscoverResult.new(result)
    end
  end
end