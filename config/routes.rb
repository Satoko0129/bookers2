Rails.application.routes.draw do
  devise_for :books
  root to: "homes#top"
   get "homes/about" => "homes#about", as: "about"
end
