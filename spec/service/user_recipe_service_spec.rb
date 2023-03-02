require 'rails_helper'

RSpec.describe "User Recipe Service" do
  it "renders webmock" do
    json_response = File.read('spec/fixtures/user_recipes.json')

    stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=12345").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
          }).to_return(status: 200, body: json_response, headers: {})
    result = UserRecipesService.get_recipes(12345)

    expect(result).to eq(JSON.parse(json_response, symbolize_names: true))
    expect(result[:data][0][:id]).to eq("20")
    expect(result[:data][0][:type]).to eq("user_recipe")
    expect(result[:data][0][:attributes][:uid]).to eq("12345")
    expect(result[:data][0][:attributes][:recipe_id]).to eq("5678")
    expect(result[:data][0][:attributes][:recipe_name]).to eq("Peanut Butter")
    expect(result[:data][1][:id]).to eq("21")
    expect(result[:data][1][:type]).to eq("user_recipe")
    expect(result[:data][1][:attributes][:uid]).to eq("12345")
    expect(result[:data][1][:attributes][:recipe_id]).to eq("5679")
    expect(result[:data][1][:attributes][:recipe_name]).to eq("Jelly")
    
  end
end