require 'rails_helper'

RSpec.describe "Discover Result Poro" do
    it "stores recipe data from a json response as attributes" do
        response = File.read('spec/fixtures/ingredient_search_results.json')
        data = JSON.parse(response, symbolize_names: true)[:data]
        first_recipe = DiscoverResult.new(data.first)
        last_recipe = DiscoverResult.new(data.last)

        expect(first_recipe.id).to eq(data.first[:id])
        expect(first_recipe.img).to eq(data.first[:attributes][:image])
        expect(first_recipe.name).to eq(data.first[:attributes][:name])
        expect(first_recipe.missing_ingr).to eq(data.first[:attributes][:missing_ingr])
        expect(first_recipe.missing_ingr_count).to eq(data.first[:attributes][:missing_ingr_count])


        expect(last_recipe.id).to eq(data.last[:id])
        expect(last_recipe.img).to eq(data.last[:attributes][:image])
        expect(last_recipe.name).to eq(data.last[:attributes][:name])
        expect(last_recipe.missing_ingr).to eq(data.last[:attributes][:missing_ingr])
        expect(last_recipe.missing_ingr_count).to eq(data.last[:attributes][:missing_ingr_count])
    end
end
