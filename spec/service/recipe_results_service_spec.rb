require 'rails_helper' 

RSpec.describe "Recipe Result Service" do
  it "renders webmock" do
    json_response = File.read('spec/fixtures/recipe_details.json')
    stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/recipes/479101/information").
    with(headers: 
            {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v2.7.4'
            }).to_return(status: 200, body: json_response, headers: {})

    result = RecipeResultsService.get_recipe_info(479101)

    expect(result).to eq(JSON.parse(json_response, symbolize_names: true))
    expect(result[:data][:id]).to eq("479101")
    expect(result[:data][:type]).to eq("recipe")
    expect(result[:data][:attributes][:id]).to eq(479101)
    expect(result[:data][:attributes][:title]).to eq("On the Job: Pan Roasted Cauliflower From Food52")
    expect(result[:data][:attributes][:ready_in_minutes]).to eq(20)
    expect(result[:data][:attributes][:image]).to eq("https://spoonacular.com/recipeImages/479101-556x370.jpg")
    expect(result[:data][:attributes][:summary]).to be_a(String)
    expect(result[:data][:attributes][:instructions]).to be_a(String)
  end
end