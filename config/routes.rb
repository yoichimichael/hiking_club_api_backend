Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/hikes', to: 'hikes#index'

  get '/members', to: 'members#index'

  get '/participations', to: 'participations#index'

  get '/comments', to: 'comments#index'

end
