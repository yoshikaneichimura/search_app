Rails.application.routes.draw do
 
  root 'homes#top' ,  as: 'top'
  get 'homes/about' , as: 'about'
  resources :posts
  resources :users, only: [:index, :show, :edit] 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
