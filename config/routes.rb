Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :pages, only: [:index, :create]
  end
end
