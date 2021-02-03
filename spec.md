# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
        Users, Listings
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        Listings, Bids
- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        bids_on_my_listings
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        skills through reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        review.comment
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        models validate: "presence", "uniqueness"
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        Search for "like words in listing title"
- [x] Include signup (how e.g. Devise)
        User.signup
- [x] Include login (how e.g. Devise)
        Session.login
- [x] Include logout (how e.g. Devise)
        Session.logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        Github - omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
        Listings > Bids(show, index)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        Listings > Bids(new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        NEEDED ON BIDS UPDATE
        Errors displayed on forms for: signup, login, 

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

reccomeendations?