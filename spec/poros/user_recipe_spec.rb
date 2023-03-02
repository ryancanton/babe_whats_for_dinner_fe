require 'rails_helper'

RSpec.describe "User Recipe Poros" do
  it "stores user_recipe data from json response" do
    response = File.read('spec/fixtures/user_recipes2.json')
    data = JSON.parse(response, symbolize_names: true)[:data][0]
    user = UserRecipe.new(data)

    expect(user.uid).to eq(data[:attributes][:uid])
    expect(user.name).to eq(data[:attributes][:recipe_name])
    expect(user.recipe_id).to eq(data[:attributes][:recipe_id])
  end
end