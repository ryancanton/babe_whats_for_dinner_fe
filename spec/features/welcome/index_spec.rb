require 'rails_helper'

RSpec.describe "welcome index" do
    it "has a welcome page for the app" do
        visit "/"
    end
end