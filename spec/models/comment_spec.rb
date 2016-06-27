require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it "must have a body" do
      c = Comment.new
      c.valid?
      expect(c.errors).to have_key(:body)
    end
  end
end
