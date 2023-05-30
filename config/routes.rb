Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  mount ActionCable.server => '/cable'
  get 'rooms/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
