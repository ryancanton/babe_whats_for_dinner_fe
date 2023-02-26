class DiscoverController < ApplicationController
  # before_action :validate_user, only: [:show, :index]

  def index
    if params[:search]
      @results = DiscoverRecipesFacade.get_results(params[:search])
    end
  end
  def show
    @recipe = RecipeResultsFacade.get_recipe(params[:id])
  end
end