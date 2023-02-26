class UserRecipesService
  def self.get_recipes(uid)
    url = "http://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=#{uid}"
      
      response = Faraday.get(url)
      if response.body != ""
        data = JSON.parse(response.body, symbolize_names: true)
      else
        return nil
      end
  end
end