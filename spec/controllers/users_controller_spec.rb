

require "rails_helper"

describe UsersController, type: :controller do

  let(:userA) {User.create!(first_name: "testUserA", email: "testA@test.com", password: "123456")}
  let(:userB) {User.create!(first_name: "testUserB", email: "testB@test.com", password: "123456")}


  describe "GET #show" do

    context "user is logged in" do

      before do
        sign_in userA
      end

      it "loads correct user profile" do
        get :show, params: {id: userA.id}
        expect(assigns(:user)).to eq userA
      end

      it 'cannot load other user profile' do
        get :show, params: {id: userB.id}
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do
        it 'redirects to root' do
        get :show, params: { id: userA.id }
        expect(response).to redirect_to(root_path)
    end

  end

end
end