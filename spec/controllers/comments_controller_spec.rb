require 'rails_helper'

describe CommentsController, type: :controller do
    before do
    @user= FactoryBot.create(:user)
    end
    let(:product) { Product.create!(name: "test_product") }

    context "when a user is logged in" do
  
      before do
        sign_in @user
      end
  
      it "can add comment" do
        expect(Comment.create!(user: @user, product_id: product.id, body: "description", rating: 5 )).to be_valid
      end
  
    end
  end