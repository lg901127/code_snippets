require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe "Validations" do
    it "requires a title" do
      u = build(:snippet, {title: nil})
      u.valid?
      expect(u.errors).to have_key(:title)
    end
    it "requires a work" do
      u = build(:snippet, {work: nil})
      u.valid?
      expect(u.errors).to have_key(:work)
    end
  end
end
