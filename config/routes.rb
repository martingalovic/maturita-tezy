Rails.application.routes.draw do
  get 'document/index'
  root 'uploads#new'

  # login

  # uploads
  resource :uploads, only: [:new, :create]

  # documents
end
