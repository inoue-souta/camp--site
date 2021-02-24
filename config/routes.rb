Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'camps#index'
  get 'explanations' => 'explanations#show'
  get 'recommended' => 'recommendeds#show'
  
  resources :camps do
    resources :profiles, only: :show
  end
  resources :explanations, only: :show
  resources :recommendeds, only: :show
  resources :users, only: :show
end
