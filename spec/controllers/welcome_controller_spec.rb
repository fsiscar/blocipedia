require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  #Context not logged_in user (no session created)

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  #Context User logded_in (session created):
  #create a session
  let(:my_user) { User.create!(email: "my_user@gmail.com", password:"password") }

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
