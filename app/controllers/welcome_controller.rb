class WelcomeController < ApplicationController
  def index
    @client_id = ENV['client_id']
  end
end