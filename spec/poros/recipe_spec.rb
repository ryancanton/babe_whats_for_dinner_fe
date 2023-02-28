require 'rails_helper'

RSpec.describe "Recipe Poro" do
    it "stores recipe data from a json response as attributes" do
        response = File.read('spec/fixtures/recipe_details.json')
        data = JSON.parse(response, symbolize_names: true)[:data]
        recipe = Recipe.new(data)
        
        expect(recipe.id).to eq(data[:attributes][:id])
        expect(recipe.title).to eq(data[:attributes][:title])
        expect(recipe.ready_in_minutes).to eq(data[:attributes][:ready_in_minutes])
        expect(recipe.image).to eq(data[:attributes][:image])
        expect(recipe.summary).to eq(data[:attributes][:summary])
        expect(recipe.instructions).to eq(data[:attributes][:instructions])
        expect(recipe.extended_ingredients).to eq(data[:attributes][:ingredients])
    end
end
