Rails.application.routes.draw do
  root 'documents#new'

  # login

  # documents
  resources :documents, only: [:index, :new, :create]
end
