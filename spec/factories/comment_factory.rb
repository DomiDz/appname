FactoryBot.define do

      factory :comment do 
        user #association :user, factory: :user 
        product #association :product, factory: :product 
        body {"body"}
        rating {5}
      end

end
