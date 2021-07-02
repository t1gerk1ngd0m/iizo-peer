Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signin', to: 'sessions#new'

  namespace :slack do
    namespace :commands do
      resources :iizo, only: [:create] do
        collection do
          post :list
        end
      end
    end
    namespace :events do
      resources :iizo, only: [:create]
    end
  end
end
