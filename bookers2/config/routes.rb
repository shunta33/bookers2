Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:new, :create, :edit, :index, :show, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  patch 'users/:id' => 'users#show'
  post 'books/:id/edit' => 'books#show', as: 'edit_book2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
