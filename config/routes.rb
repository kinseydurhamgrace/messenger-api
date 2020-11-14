Rails.application.routes.draw do
  resources :messages, only: [:create]
  resources :users, only: [:index, :show]
end
