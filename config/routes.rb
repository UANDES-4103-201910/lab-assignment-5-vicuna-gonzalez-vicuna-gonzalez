Rails.application.routes.draw do
  resources :event_venues, :users, :events
  resources :tickets do
    resources :ticket_types
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
