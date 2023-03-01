require 'rails_helper'

RSpec.describe 'User Dashboard' do
    before (:each) do
      user = User.create!(uid: "12345")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/user_recipes.json')

      stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=12345").
          with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).to_return(status: 200, body: json_response, headers: {})
    end
  it 'contains a list of a users saved recipes that are links to the recipes show page' do
    visit dashboard_path
    save_and_open_page
    expect(page).to have_link('Peanut Butter', href: "/discover/5678")
    expect(page).to have_link('Jelly', href: "/discover/5679")
  end

  it "has a link to delete a favorited recipe" do
    visit dashboard_path

    json_response = File.read('spec/fixtures/user_recipes2.json')

    stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=12345").
        with(
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
          }).to_return(status: 200, body: json_response, headers: {})

    stub_request(:delete, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?recipe_id=5678&uid=12345").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: "", headers: {})
    within "div#5678" do
      expect(page).to have_link('Peanut Butter', href: "/discover/5678")
      expect(page).to have_button("Delete Recipe")

      click_button("Delete Recipe")
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_content('Peanut Butter')
  end
end