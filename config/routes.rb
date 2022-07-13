Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'
  get '/guests/:id/edit', to: 'guests#edit'
  patch '/guests/:id', to: 'guests#update'
  delete '/guests/:id', to: 'guests#destroy'

  get '/cabins', to: 'cabins#index'
  get '/cabins/new', to: 'cabins#new'
  post '/cabins', to: 'cabins#create'
  get '/cabins/:id', to: 'cabins#show'
  get '/cabins/:id/edit', to: 'cabins#edit'
  patch '/cabins/:id', to: 'cabins#update'
  delete '/cabins/:id', to: 'cabins#destroy'

  get '/cabins/:id/guests', to: 'cabin_guests#index'
  get '/cabins/:id/guests/new', to: 'cabin_guests#new'
  post '/cabins/:id/guests', to: 'cabin_guests#create'
  get '/cabins/:id/guests/:sorted', to: 'cabin_guests#index'
  # get '/cabins/:id/guests/:plus_one_count', to: 'cabin_guests#index'

end
