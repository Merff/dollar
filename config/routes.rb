Rails.application.routes.draw do

  root to: 'dollars#show'

  get '/admin', to: 'dollars#edit'

  resources :dollars, only: [:show, :update, :edit]
end
