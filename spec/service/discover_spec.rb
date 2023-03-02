require 'rails_helper'

RSpec.describe "Discover Service" do
  it "renders webmock" do
    json_response = File.read('spec/fixtures/ingredient_search_results.json')

    stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/recipes/findByIngredients?ingredients=apples,flour,sugar").
      with(headers: 
            {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
            } ).to_return(status: 200, body: json_response, headers: {})

    result = DiscoverResultsService.get_search_results("apples,flour,sugar")
    expect(result).to eq(JSON.parse(json_response, symbolize_names: true))
    expect(result[:data][0][:id]).to eq("47890")
    expect(result[:data][0][:type]).to eq("discover")
    expect(result[:data][0][:attributes][:image]).to eq("https://spoonacular.com/recipeImages/47890-312x231.jpg")
    expect(result[:data][0][:attributes][:name]).to eq("Blackberry-Apple Pie Filling",)
    expect(result[:data][0][:attributes][:missing_ingr_count]).to eq(2)
  end
end