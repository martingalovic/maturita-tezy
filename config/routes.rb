Rails.application.routes.draw do
  get 'static_pages/plan'
  root 'documents#new'

  # auth
  get '/logout', to: 'sessions#logout', as: :logout
  post '/login', to: 'sessions#login', as: :login

  # documents
  resources :documents, only: [:index, :new, :create] do
    get '/download', action: :download
    get '/check', action: :check
  end
end
