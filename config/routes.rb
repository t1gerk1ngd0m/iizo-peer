Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'signin', to: 'sessions#new'

  resources :sessions, only: [:create, :destroy]
  resources :iizo, only: [:create]
end
