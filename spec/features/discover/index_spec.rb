require 'rails_helper'

RSpec.describe "Recipe Search" do
  it 'displays the results of recipes based on the inputted ingredients' do
    user = User.create!(uid: "12345")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    json_response = File.read('spec/fixtures/ingredient_search_results.json')

    stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/recipes/findByIngredients?ingredients=apples,flour,sugar").
      with(headers: 
            {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
            }
          ).to_return(status: 200, body: json_response, headers: {})


    

    visit "/discover"
    fill_in :search, with: 'apples, flour, sugar'
    click_button "Find Recipes"

    expect(current_path).to eq(discover_index_path)
    expect(page).to have_content("Results: 100")
    expect(page).to have_content("Name: ", count: 100)
    within "div#47890" do
      expect(page).to have_content('Name: Blackberry-Apple Pie Filling')
      expect(page).to have_css("img[src*='https://spoonacular.com/recipeImages/47890-312x231.jpg']")
      expect(page).to have_content("2 missing ingredients:")
      expect(page).to have_content("12.0 oz blackberries")
      expect(page).to have_content("0.5 cup butter")
      
    end
  end
end