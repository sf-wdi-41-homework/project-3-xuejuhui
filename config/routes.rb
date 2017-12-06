Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "main#index"
get "/signup", to: "users#new", as: "new_user"
post '/users', to: 'users#create'
get '/profile', to: 'users#show', as: 'user'
get "/users/:id/edit", to: 'users#edit', as: 'edit_user'
put '/users/:id', to: 'users#update', as: 'update_user'
delete '/users/:id', to: 'users#destroy', as:"delete_user"

get '/login', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

get '/recipes', to: 'recipes#index', as: "recipes"
post "/recipes", to: 'recipes#index'
post '/recipesave', to: 'recipes#create', as:'recipesave'



end
