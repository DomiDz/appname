Rails.application.routes.draw do
  
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { registrations: "user_registrations" }
  resources :users
  resources :products do
    resources :comments
    end
# root "simple_pages#landing_page"
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/kontakt'
  get 'simple_pages/impressum'
  get 'simple_pages/photography'
  get 'simple_pages/products'
  get 'simple_pages/datenschutz'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'payments/create'
  root 'simple_pages#index'
  post 'simple_pages/thank_you'
  post 'payments/create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
