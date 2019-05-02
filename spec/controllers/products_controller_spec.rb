require "rails_helper"

describe ProductsController, type: :controller do

    before do
        @user= FactoryBot.create(:user)
        @admin = FactoryBot.create(:admin)
        @product = FactoryBot.create(:product)
    end

  #let(:product) { Product.create!(name: "test_product", description: "desc", image_url: "test.png") }


  describe "GET index" do
    it "renders the right one" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    it "shows products page" do
      get :show, params: {id: @product.id}
      expect(response).to be_ok
    end
  end

  context "GET new" do

    it "redirects to new product page" do
    sign_in @admin
    get :new
    expect(response).to be_ok
    end

    it "should not work now" do
    sign_in @user
    get :new
    expect(response).not_to be_ok
    end

  end

  describe "GET edit" do
    
    it "redirects to edit page" do
    sign_in @admin
    get :edit, params: {id: @product.id}
    expect(response).to be_ok
    end

    it 'should not work now' do
    sign_in @user
    get :edit, params: {id: @product.id}
    expect(response).not_to be_ok
    end

  end

  describe "POST create" do
    
    it "creates a new product" do
    sign_in @admin 
    expect(response).to be_successful
    end

  end

  describe "PUT destroy" do

    it "destroys product" do
    sign_in @admin
    delete :destroy, params: {id: @product.id}
    expect(response).to redirect_to products_url
    end

    it 'should not work now' do
    sign_in @user
    delete :destroy, params: {id: @product.id}
    expect(response).to_not be_ok
    end
end


end