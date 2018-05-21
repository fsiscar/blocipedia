require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { User.create!(email: RandomData.random_email, password: RandomData.random_word) }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki body", private: true, user: my_user) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki body")
    end
  end
end
