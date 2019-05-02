require "rails_helper"

describe OrdersController, type: :controller do
    before do
        @user= FactoryBot.create(:user)
        @product = FactoryBot.create(:product)
    end



  context " when a user is logged in " do

    before do
      sign_in @user
    end

    it "is a valid order" do
      expect(Order.new(user: @user, product: @product, total: 1)).to be_valid
    end
    
  end
end