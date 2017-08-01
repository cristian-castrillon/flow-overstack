Rails.application.routes.draw do
  resources :answers
  resources :questions, except: [:edit, :update, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
end
