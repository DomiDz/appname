

require "rails_helper"

describe UsersController, type: :controller do

 #let(:user) {User.create!(first_name: "testUserA", email: "testA@test.com", password: "123456")}
  #  let(:userB) {User.create!(first_name: "testUser", email: "testB@test.com", password: "123456")}
  before do 
   @user1= FactoryBot.create(:user)
   @user2= FactoryBot.create(:user)
  end

  describe "GET #show" do

    context "user is logged in" do

      before do
        sign_in @user1
      end

      it "loads correct user profile" do
        get :show, params: {id: @user1.id}
        expect(assigns(@user1)).to eq @user1
      end

      it 'cannot load other user profile' do
        get :show, params: {id: @user2.id}
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do
        it 'redirects to root' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(root_path)
    end

  end

end
end