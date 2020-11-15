Rails.application.routes.draw do
  resources :messages, only: [:create] do
    collection do
      get '/:recipient_id/recent/:sender_id' => 'messages#most_recent_from_sender', as: :most_recent_from_sender
      get '/:recipient_id/recent' => 'messages#most_recent', as: :most_recent
    end
  end
  resources :users, only: [:index, :show]
end
