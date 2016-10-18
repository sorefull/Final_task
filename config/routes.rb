Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :products do
    resources :reviews, except: [:index, :show, :new]
    collection do
      get 'reviews', to: 'reviews#index'
    end
  end
  get '/', to: 'products#welcome', as: 'welcome'
  resources :categories
  resources :orders, only: [:index, :destroy]
  get 'shopping_cart', to: 'orders#edit', as: 'shopping_cart'
  patch 'order', to: 'orders#update', as: 'update_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
