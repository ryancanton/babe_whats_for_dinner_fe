require 'rails_helper'

# As a user,
# when I visit '/users/:user_id/discover_recipes' (user_discover_recipe_path),
# I see an ingredient input field.
# When I input my ingredients(separated by comma),
# and click the 'Find Recipes' button
# I am taken to '/recipes?ingredients={some_list} (recipes_path),
# And I see a list of recipes that can be made with my ingredients,
# And recipes that contain mostly my ingredients with a list of the missing ingredients needed to complete the recipe.
# And recipes will be returned in order of most complete to least complete.
# And a 'Search Again' button.
# When I press the 'Search Again' button,
# I am taken to '/users/:id/discover_recipes'
# .limit(# of recipes)?

RSpec.describe "Recipe Search" do
  it 'displays the results of recipes based on the inputted ingredients' do
    json_response = File.read('spec/fixtures/ingredient_search_results.json')

    stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=apples%2Cflour%2Csugar&number=200&ignorePantry=true&ranking=1")
      .with(headers: { 'X-RapidAPI-Key' => '4f4fbc3ba2msh745c24cf4e7edbdp13621djsn50bc1816f418', 'X-RapidAPI-Host' => 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com' })
      .to_return(status: 200, body: json_response, headers: {})


    

    visit "/discover"
    fill_in :search, with: 'apples, flour, sugar'
    click_button "Find Recipes"

    expect(current_path).to eq(discover_index_path)
    expect(page).to have_content("Results: 20")
    expect(page).to have_content("Name: ", count: 20)
    within "div#47890" do
      expect(page).to have_content('Name: Blackberry-Apple Pie Filling')
      expect(page).to have_css("img[src*='https://spoonacular.com/recipeImages/47890-312x231.jpg']")
      expect(page).to have_content("2 missing ingredients:")
      expect(page).to have_content("12.0 oz blackberries")
      expect(page).to have_content("0.5 cup butter")
      
    end
  end
end