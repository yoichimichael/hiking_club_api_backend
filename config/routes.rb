Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/hikes', to: 'hikes#index'
  post '/hikes', to: 'hikes#create'
  get '/hikes/:id', to: 'hikes#show'
  patch '/hikes/:id', to: 'hikes#update'
  delete '/hikes/id', to: 'hikes#delete' 

  get '/members', to: 'members#index'
  post '/members', to: 'members#create'
  get '/members/:id', to: 'members#show'
  patch '/members/:id', to: 'members#update'
  delete '/members/id', to: 'members#delete' 

  get '/participations', to: 'participations#index'

  get '/comments', to: 'comments#index'

end
