require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "test_user@gmail.com", password: "password") }

  # Shouldda tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("test_user@gmail.com").for(:email) }

  # Shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have name, email, and role attributes" do
      expect(user).to have_attributes(name: "test_user@gmail.com", email: "password", role: user.role )
    end
  end
end
