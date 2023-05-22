Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#home'
  resources :projects, only: %i[index new create show] do
    member do
      post 'assign_team', to: 'assign_team', as: :assign_team
    end
    resources :tasks, only: %i[index new create]
  end

  resources :tasks, only: [:show] do
    patch 'complete', on: :member, action: :complete
    resources :jobs, only: %i[new create]
  end

  patch '/jobs/:id', to: 'jobs#complete', as: 'complete_job'

  resources :teams, only: %i[index new create]
end
