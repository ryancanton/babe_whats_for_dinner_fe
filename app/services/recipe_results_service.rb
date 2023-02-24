class RecipeResultsService
    def self.get_recipe_info(id)
      url = "https://babe_whats_for_dinner_be.herokuapp.com/recipes/#{id}/information"
      
      response = Faraday.get(url)
  
      data = JSON.parse(response.body, symbolize_names: true)
    end

  end