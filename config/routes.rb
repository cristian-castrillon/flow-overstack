Rails.application.routes.draw do
  resources :questions, except: [:edit, :update, :destroy] do
    resources :answers, only: [:create]
    resources :comments, only: [:create]
  end
  get 'questions/:id/answers', to: 'questions#show'
  get 'questions/:id/comments', to: 'questions#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
end
