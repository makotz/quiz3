require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:comment) { FactoryGirl.create(:comment) }

  describe "#create" do
    context "without proper user sign in" do
      it "redirects to the sign in page" do
        post :create, comment_id: comment.id
        expect(response).to redirect_to(new_session_path)
      end
    end
    context "with proper user sign in" do
      it ""

    end
  end
  describe "#delete"
end
