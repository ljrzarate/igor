Rails.application.routes.draw do
  root to: "pages#show"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resource :dashboard, only: [:show]
end
