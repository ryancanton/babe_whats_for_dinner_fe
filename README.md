<h1 align="center">
  Babe, What's For Dinner?
</h1>

<p align="center">
  <img width="600" src="https://wp.en.aleteia.org/wp-content/uploads/sites/2/2018/05/web3-mediterranean-food-middle-eastern-food-israeli-dishes-falafel-hummus-pita-bread-shutterstock.jpg?w=640&crop=1">
</p>

<h3 align="center">This repo handles the Front End project responsibilities. <a href="https://github.com/jlweave/babe_what_for_dinner_be">Click Here</a> to visit our Back End repo
</h3>

## Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Website Navigation](#website-navigation)
- [Setup and Installation](#setup-and-installation)
- [Learning Goals](#learning-goals)
- [API Information](#api-information) 
- [Minimum Viable Product Brainstorm](#minimum-viable-product-brainstorm)
- [Responsible Parties](#responsible-parties)

## Project Overview

**_Babe, What's For Dinner?_** is an application that allows users to input ingredients they have on hand to return recipes that include all of those ingredients.

If a user has MOST ingredients on hand, **_Babe, What's For Dinner?_** will return other recipes ordered by the number of missing ingredients, indicate which ingredients are missing, and the cost of those ingredients from Kroger / King Soopers.

When a user creates an account, they are provided their own **_Babe, What's For Dinner?_** dashboard which allows them to save recipes.

Check us out! https://babe-whats-for-dinner-fe.herokuapp.com

## Tech Stack
![BWFD Tech Stack](https://user-images.githubusercontent.com/109649285/222281020-da5e7bea-b784-41f4-83fa-6e6f8aeb90cf.png)

## Website Navigation
<p>
  <img width="500" src="https://user-images.githubusercontent.com/113324661/222539803-66abe859-91dc-410c-a5d3-874d1e2e0f3a.png">
  <img width="500" src="https://user-images.githubusercontent.com/113324661/222539870-4385b55b-a226-4102-973e-90175d94f260.png">
</p>
<p>
  <img width="500" src="https://user-images.githubusercontent.com/113324661/222539952-19851190-d858-41ac-935a-f9f41a7571dd.png">
  <img width="500" src="https://user-images.githubusercontent.com/113324661/222540061-ac2ffb1e-f119-4dab-bcb9-cfcdc6d2d034.png">
</p>
<p>
  <img width="500" src="https://user-images.githubusercontent.com/113324661/222540118-1ac18b28-7976-4fc0-bf2f-a3d5793f5cfc.png">
  <img width="500" src="https://user-images.githubusercontent.com/113324661/222540184-3ce2e8d6-0df4-4f7c-b08a-ffdd1987758e.png">
</p>


## Setup and Installation

From your terminal, run:

```git clone git@github.com:ryancanton/babe_whats_for_dinner_fe.git```

```bundle install```

```rails db:create```

To run the tests: ```bundle exec rspec```

To run the server on localhost:3000: ```rails s```

## Learning Goals

- Employ Service-Oriented Architecture to create a working app with separate front and back ends
- Create a descriptive and inticing ReadMe
- Build and consume APIs
- Implement OAuth for user registration
- Create wireframes and user stories to facilitate programming

## API Information
We are consuming the <a href= "https://spoonacular.com/food-api">Spoonacular API </a>for this project.
- <a href= "https://spoonacular.com/food-api/recipes">Recipes Index</a>
- <a href= "https://spoonacular.com/food-api/recipes/#{query}/information">Recipes Show</a>

## Minimum Viable Product Brainstorm
<p>
  <img width="250" src="https://user-images.githubusercontent.com/113324661/222260792-fb4e8151-e745-4a57-a7cc-fc347b706b66.jpg">
</p>

## Responsible Parties

| [<img alt="Patricia" width="75" src="https://media.licdn.com/dms/image/D5603AQGzX_m1LUMr_A/profile-displayphoto-shrink_200_200/0/1663361750344?e=1682553600&v=beta&t=TXBR2rv_HTlX4MLFZSr_2LzvtnoAcwpSxWI_4QI4G_M"/>](https://www.linkedin.com/in/patricia-severance/) | [<img alt="Lacey" width="75" src="https://media.licdn.com/dms/image/D5635AQGZ0m5EG6d4jA/profile-framedphoto-shrink_200_200/0/1676492118517?e=1677718800&v=beta&t=thDenRoIFDo9TVKJvGiljhOZ_lgsfzOoJSbNdKKBw6c"/>](https://www.linkedin.com/in/lacey-weaver-be-dev/) | [<img alt="William" width="75" src="https://media.licdn.com/dms/image/D4E03AQFXtv0vK34G5g/profile-displayphoto-shrink_200_200/0/1667609395898?e=1682553600&v=beta&t=9j0UzDD2Z7UyMITN3dbbam-eMU3TUJMU40KYXldTU64"/>](https://www.linkedin.com/in/william-lampke-b4a5b5250/) | [<img alt="Ryan" width="75" src="https://media.licdn.com/dms/image/D4E03AQFAbg5Mt0mzHw/profile-displayphoto-shrink_200_200/0/1667417343436?e=1682553600&v=beta&t=RhEB2cemwMoMrLFIRoWxoo0rJtC_E2p49IKcCgj7Vew"/>](https://www.linkedin.com/in/ryan-canton-6a4854255/) | [<img alt="Bryan" width="75" src="https://media.licdn.com/dms/image/D5635AQEBmKDa-aG5xA/profile-framedphoto-shrink_200_200/0/1663424429417?e=1677718800&v=beta&t=zB0LaTprhkD-9ayrYy1zR0Bh5-8oX9hnQvW3UtQPsbY"/>](https://www.linkedin.com/in/bryanflanagan138/) | [<img alt="Brian" width="75" src="https://media.licdn.com/dms/image/C4E03AQEUXg6H7kEPUA/profile-displayphoto-shrink_200_200/0/1516937573213?e=1682553600&v=beta&t=WAVJpPaaD5UwBSm6oqRcw09jav7jqbPro8UGgW9Gw4w"/>](https://www.linkedin.com/in/brianzanti/) |
| ------------------ | ------------ | -------------- | ----------- | -------------- | ----------- |
| Patricia Severance | Lacey Weaver | William Lampke | Ryan Canton | Bryan Flanagan | Brian Zanti |
| Collaborator | Collaborator | Collaborator | Collaborator | Collaborator | Project Manager |
| [GitHub](https://github.com/pkseverance) | [GitHub](https://github.com/jlweave) | [GitHub](https://github.com/WilliamLampke) | [GitHub](https://github.com/ryancanton) | [GitHub](https://github.com/bflanagan138) | [GitHub](https://github.com/brianzanti) |
| [LinkedIn](https://www.linkedin.com/in/patricia-severance/) |  [LinkedIn](https://www.linkedin.com/in/lacey-weaver-be-dev/) | [LinkedIn](https://www.linkedin.com/in/william-lampke-b4a5b5250/) | [LinkedIn](https://www.linkedin.com/in/ryan-canton-6a4854255/) | [LinkedIn](https://www.linkedin.com/in/bryanflanagan138/) | [LinkedIn](https://www.linkedin.com/in/brianzanti/) |
