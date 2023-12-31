Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/hobbyists', to: 'hobbyists#index'
  get 'hobbyists/new', to: 'hobbyists#new'
  get '/hobbyists/:id', to: 'hobbyists#show'
  patch '/hobbyists/:id', to: 'hobbyists#edit'
  delete '/hobbyists/:id', to: 'hobbyists#destroy'
  get '/hobbyists/:id/update', to: 'hobbyists#update'
  get '/hobbyists/:id/projects', to: 'hobbyists#show_projects'
  get '/hobbyists/:id/projects/new', to: 'hobbyists#new_project'
  get '/hobbyists/:id/projects/:sort', to: 'hobbyists#show_projects'
  post '/hobbyists', to: 'hobbyists#create'
  post '/hobbyists/:id/projects', to: 'hobbyists#create_project'

  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  patch '/projects/:id', to: 'projects#edit'
  delete '/projects/:id', to: 'projects#destroy'
  get '/projects/:id/update', to: 'projects#update'
end
