Rails.application.routes.draw do
  get 'lists/index'

  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # get 'lists', to: 'lists#index', as: :lists
  # get 'lists/new', to: 'lists#new', as: :new_list
  # get 'lists/:id', to: 'lists#show', as: :list
  # post 'lists', to: 'lists#create', as: :create_list
  #  get '/bookmarks/:id', to: 'bookmarks#destroy'
  # post 'lists/:id/bookmarks', to: 'bookmarks#create'
end
