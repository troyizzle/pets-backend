Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show]
    get 'whoami', to: 'users#whoami'

    resources :pets

    namespace :pets do
      namespace :background do
        resources :questions, only: %w[index]
      end
    end

    namespace :user do
      resource :pets, only: %w[create show]
      get 'pets/me', to: 'pets#me'
      get 'notifications/me', to: 'notifications#me'

      get 'notifications/:id/read', to: 'notifications#read'
      get 'notifications/:id/unread', to: 'notifications#unread'
      get 'notifications/:id/delete', to: 'notifications#delete'
    end
  end

  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  mount ActionCable.server => '/cable'
end
