Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/hobbyists', to: 'hobbyists#index'
  get 'hobbyists/new', to: 'hobbyists#new'
  get '/hobbyists/:id', to: 'hobbyists#show'
  get '/hobbyists/:id/projects', to: 'hobbyists#show_projects'
  get '/hobbyists/:id/projects/new', to: 'hobbyists#new_project'
  post '/hobbyists', to: 'hobbyists#create'
  post '/hobbyists/:id/projects', to: 'hobbyists#create_project'

  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
end
