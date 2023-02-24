class RecipeResultsService
    def self.get_recipe_info(id)
      url = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{id}/information"
      conn = Faraday.new(url: 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com') do |faraday|
        faraday.headers["X-RapidAPI-Key"] = '4f4fbc3ba2msh745c24cf4e7edbdp13621djsn50bc1816f418'
        faraday.headers["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
      end
      response = conn.get(url)
  
      data = JSON.parse(response.body, symbolize_names: true)
    end

  end