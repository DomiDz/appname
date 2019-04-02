require 'rails_helper'

describe Product do
    context "when the product has comments" do
        let(:product) {Product.create!(name: 'Racing Bike')}
        let(:user) {User.create!(email: 'test@mail.de', password: 'test1234')}
        before do
            product.comments.create!(rating: 1, user: user, body: 'awesome')
            product.comments.create!(rating: 3, user: user, body: 'awesome')
            product.comments.create!(rating: 5, user: user, body: 'awesome')
        end
        it 'returns the average rating of all comments' do 
            expect(product.average_rating).to eq 3
        end
    end

    
    context 'when creating product' do 

        it 'is not valid without a Name' do
            expect(Product.new(description: 'awesome')).not_to be_valid
        end

        it 'is valid with a Name and Description' do 
            expect(Product.new(name: 'awesome Bike', description: 'awesome')).to be_valid
        end
        
        it 'is valid with just a name' do 
            expect(Product.new(name: 'awesome Bike')).to be_valid
        end
    end
end


