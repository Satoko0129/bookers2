Rails.application.routes.draw do

  devise_for :users

  resources :books
  resources :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resources :book_comments, only: [:create]
  end
  resources :books, only: [:new, :create, :edit, :index, :show, :destroy] do
end
    resources :users, only: [:index, :show, :edit, :update]
end