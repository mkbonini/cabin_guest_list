Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'

  get '/cabins', to: 'cabins#index'
  get '/cabins/:id', to: 'cabins#show'
  # resources :cabins 
  get '/cabins/:id/guests', to: 'cabin_guests#index'
end
