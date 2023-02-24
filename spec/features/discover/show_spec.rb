require 'rails_helper' 

RSpec.describe 'show' do
    it 'shows the details of a specific recipe' do
        json_response = File.read('spec/fixtures/recipe_details.json')
    stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/479101/information")
      .with(headers: { 'X-RapidAPI-Key' => '4f4fbc3ba2msh745c24cf4e7edbdp13621djsn50bc1816f418', 'X-RapidAPI-Host' => 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com' })
      .to_return(status: 200, body: json_response, headers: {})

        visit "/discover/479101"
        expect(page).to have_content("On the Job: Pan Roasted Cauliflower From Food52")
        expect(page).to have_content("Time to cook: 20")
        expect(page).to have_content("breadcrumbs 0.5 cup")
        expect(page).to have_content("sumac 0.5 teaspoon")
        expect(page).to have_content("Cut the florets off the stems and and then chop them into tiny florets. You can also chop up the stems into tiny pieces if you want. You should have about 6 cups of chopped cauliflower. In a large skillet heat 2 tablespoons of olive oil over medium-high heat. Add the cauliflower, 1 teaspoon of salt, rosemary, and sumac. Sauté until cauliflower is tender and starts to brown a bit, stirring as necessary, about 15 minutes. You can also add a bit of olive oil if the pan starts to get too dry or the cauliflower is starting to stick. Meanwhile, in a small skillet, toast the pinenuts over medium heat until golden brown. Set aside. Heat the remaining 2 tablespoons of olive oil in the same pan. Once oil is shimmering, toss in the breadcrumbs and stir, toasting the breadcrumbs. Season with a pinch of kosher salt and a few turns of freshly ground black pepper. Remove from the heat and toss in half of the chopped parsley. When cauliflower is done, remove from the heat and season to taste with freshly ground black pepper and a pinch or so of salt if necessary. Toss in the toasted pine nuts, the chopped raisins, and the remaining parsley. When ready to serve, sprinkle the top with the toasted breadcrumbs and some pecorino.")
        
    end
end