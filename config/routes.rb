Rails.application.routes.draw do
  get 'foods/index'
  post 'foods/index'


  devise_for :users
  root to: "foods#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :foods
  resources :courses
  
end
