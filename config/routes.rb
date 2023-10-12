Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/hobbyists', to: 'hobbyists#index'
  get '/hobbyists/:id', to: 'hobbyists#show'

  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
end
