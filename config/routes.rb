Rails.application.routes.draw do
  get 'foods/index'
  post 'foods/index'

  get 'courses/index'
  post 'courses/index'

  devise_for :users
  root to: "foods#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create]
  resources :courses, only: [:index, :new, :create]
  
end
