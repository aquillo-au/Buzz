Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
  resources :projects, only: %i[index new create show] do
  end
  resources :teams, only: %i[index new create] do
  end
end
