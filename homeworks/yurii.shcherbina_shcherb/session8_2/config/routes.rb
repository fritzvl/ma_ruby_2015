Rails.application.routes.draw do
  get 'index' => 'application#index'
  get '/users/signup' => 'application#signup'
  post '/users/new' => 'application#create'
  get '/signin' => 'application#signin'
  match '/users/:id', to: 'application#users', via: [:get,:post]
  get '/users/save/:id' => 'application#save'
end
