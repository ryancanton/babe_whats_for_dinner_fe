class DashboardController < ApplicationController
  before_action :validate_user, only: :show

  def show
    @saved_recipes = UserRecipesFacade.get_recipes(current_user.uid)
  end
  
end