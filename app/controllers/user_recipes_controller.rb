class UserRecipesController < ApplicationController
  def create
    Faraday.post("https://babe-whats-for-dinner-be.herokuapp.com/api/v1/user_recipes?uid=#{params[:uid]}&recipe_id=#{params[:recipe_id]}&recipe_name=#{params[:recipe_name]}")
    redirect_to dashboard_path
  end
end