Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signin', to: 'sessions#new'

  namespace :slack_commands do
    namespace :v1 do
      resources :iizo, only: [:create] do
        collection do
          post :list
        end
      end
    end
  end
end
