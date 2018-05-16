require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  #Context not signed_in user:

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  #Context User signed_in:
  describe "GET index" do
    it "renders the index template" do
      my_user = User.create!(email: RandomData.random_email, password: RandomData.random_word)
      my_user.confirm
      sign_in my_user
      get :index
      expect(response).to render_template("index")
    end
  end
end
