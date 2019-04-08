

require "rails_helper"

describe UsersController, type: :controller do

#   let(:userA) {User.create!(first_name: "testUserA", email: "testA@test.com", password: "123456")}
#    let(:user) {User.create!(first_name: "testUser", email: "testB@test.com", password: "123456")}
  before do 
      @user_a = FactoryBot.create(:user)
      @user_b = FactoryBot.create(:user)
  end

  describe "GET #show" do

    context "user is logged in" do

      before do
        sign_in @user_a
      end

      it "loads correct user profile" do
        get :show, params: {id: @user_a.id}
        expect(assigns(:user)).to eq user_a
      end

      it 'cannot load other user profile' do
        get :show, params: {id: user_b.id}
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do
        it 'redirects to root' do
        get :show, params: { id: @user_a.id }
        expect(response).to redirect_to(root_path)
    end

  end

end
end