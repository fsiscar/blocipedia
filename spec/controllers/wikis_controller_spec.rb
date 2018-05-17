require 'rails_helper'


RSpec.describe WikisController, type: :controller do
  my_user = User.create!(email: RandomData.random_email, password:RandomData.random_word)
  my_user.confirm
  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }


  describe "GET index" do
    it "returns http success" do
      sign_in my_user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      sign_in my_user
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET show" do
    it "returns http success" do
      sign_in my_user
      get :show, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      sign_in my_user
      get :show, params: { id: my_wiki.id }
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      sign_in my_user
      get :show, params: { id: my_wiki.id }
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET new" do
    it "returns http success" do
      sign_in my_user
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      sign_in my_user
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      sign_in my_user
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Wiki by 1" do
      sign_in my_user
      expect{ post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      sign_in my_user
      post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      sign_in my_user
      post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      sign_in my_user
      get :edit, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view}" do
      sign_in my_user
      get :edit, params: { id: my_wiki.id }
      expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @wiki" do
      sign_in my_user
      get :edit, params: { id: my_wiki.id }

      wiki_instance = assigns(:wiki)

      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
    end
  end

  describe "PUT update" do
    it "updates the wiki with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      sign_in my_user

      put :update, params: { id: my_wiki.id, wiki: {title: new_title, body: new_body} }

      updated_wiki= assigns(:wiki)
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      sign_in my_user

      put :update, params: { id: my_wiki.id, wiki: {title: new_title, body: new_body} }
      expect(response).to redirect_to my_wiki
    end
  end

  describe "DELETE destroy" do
    it "deletes the wiki" do
      sign_in my_user
      delete :destroy, params: { id: my_wiki.id }
      count = Wiki.where({id: my_wiki.id}).size
      expect(count).to eq 0
    end

    it "redirect to wikis index" do
      sign_in my_user
      delete :destroy, params: { id: my_wiki.id }
      expect(response).to redirect_to wikis_path
    end
  end
end
