Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signin', to: 'sessions#new'

  namespace :api do
    namespace :v1 do
      resources :iizo, only: [:create]
    end
  end
end
