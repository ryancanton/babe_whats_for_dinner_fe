class RecipeResultsService
    def self.get_recipe_info(id)
      url = "http://babe-whats-for-dinner-be.herokuapp.com/api/v1/recipes/#{id}/information"
      response = Faraday.get(url)
      
      
      data = JSON.parse(response.body, symbolize_names: true)    end

  end