class UserRecipesController < ApplicationController
  def create
    Faraday.post("https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=#{params[:uid]}&recipe_id=#{params[:recipe_id]}&recipe_name=#{params[:recipe_name]}")
    if response.status == 201
       @saved_recipes = UserRecipesFacade.get_recipes(current_user.uid)
       redirect_to dashboard_path
    else 
      flash[:errors] = "You already have this recipe saved"
      redirect_to discover_path(params[:recipe_id])
    end
  end

  def destroy
    Faraday.delete("https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=#{params[:uid]}&recipe_id=#{params[:recipe_id]}")
    @saved_recipes = UserRecipesFacade.get_recipes(current_user.uid)
    redirect_to dashboard_path
  end
end