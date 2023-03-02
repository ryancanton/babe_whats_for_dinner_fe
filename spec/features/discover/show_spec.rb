require 'rails_helper' 

RSpec.describe 'show' do
    it 'shows the details of a specific recipe and has a button to save the recipe' do
        user = User.create!(uid: "12345")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        json_response = File.read('spec/fixtures/recipe_details.json')
        stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/recipes/479101/information").
        with(headers: 
                {
                    'Accept'=>'*/*',
                    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                    'User-Agent'=>'Faraday v2.7.4'
                }
            ).to_return(status: 200, body: json_response, headers: {})

        json_response2 = File.read('spec/fixtures/post.json')
        stub_request(:post, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=12345&recipe_id=479101&recipe_name=On the Job: Pan Roasted Cauliflower From Food52").
        with(headers: 
                {
                    'Accept'=>'*/*',
                    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                    'User-Agent'=>'Faraday v2.7.4'
                }
            ).to_return(status: 200, body: json_response2, headers: {})

        json_response3 = File.read('spec/fixtures/post2.json')
        stub_request(:get, "https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=12345").
        with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Faraday v2.7.4'
            }).
        to_return(status: 200, body: json_response3, headers: {})
   

        visit "/discover/479101"
        expect(page).to have_content("On the Job: Pan Roasted Cauliflower From Food52")
        expect(page).to have_css("img[src*='https://spoonacular.com/recipeImages/479101-556x370.jpg']")
        expect(page).to have_content("Time to cook: 20")
        expect(page).to have_content("0.5 cup breadcrumbs")
        expect(page).to have_content("0.5 teaspoon sumac")
        expect(page).to have_content("Cut the florets off the stems and and then chop them into tiny florets. You can also chop up the stems into tiny pieces if you want. You should have about 6 cups of chopped cauliflower. In a large skillet heat 2 tablespoons of olive oil over medium-high heat. Add the cauliflower, 1 teaspoon of salt, rosemary, and sumac. Sauté until cauliflower is tender and starts to brown a bit, stirring as necessary, about 15 minutes. You can also add a bit of olive oil if the pan starts to get too dry or the cauliflower is starting to stick. Meanwhile, in a small skillet, toast the pinenuts over medium heat until golden brown. Set aside. Heat the remaining 2 tablespoons of olive oil in the same pan. Once oil is shimmering, toss in the breadcrumbs and stir, toasting the breadcrumbs. Season with a pinch of kosher salt and a few turns of freshly ground black pepper. Remove from the heat and toss in half of the chopped parsley. When cauliflower is done, remove from the heat and season to taste with freshly ground black pepper and a pinch or so of salt if necessary. Toss in the toasted pine nuts, the chopped raisins, and the remaining parsley. When ready to serve, sprinkle the top with the toasted breadcrumbs and some pecorino.")
    
        click_button "Save to My Recipes"
      
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_link("On the Job: Pan Roasted Cauliflower From Food52", href: "/discover/479101")
    end
end

