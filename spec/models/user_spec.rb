require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "requires a first name" do
      u = build(:user, {first_name: nil})
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end
    it "requires a last name" do
      u = build(:user, {last_name: nil})
      u.valid?
      expect(u.errors).to have_key(:last_name)
    end
    it "requires an email" do
      u = build(:user, {email: nil})
      u.valid?
      expect(u.errors).to have_key(:email)
    end
    it "requires the email to be unique" do
      create(:user, email: "a@a.com")
      u = build(:user, email: "a@a.com")
      u.valid?
      expect(u.errors).to have_key(:email)
    end
  end
end
