Rails.application.routes.draw do
  root 'homes#top'  , as: 'top'
  get 'homes/about' , as: 'about'
  devise_for :users
  resources :posts
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
