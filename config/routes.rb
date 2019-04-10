Rails.application.routes.draw do
  resources :event_venues, :users, :events
  resources :ticket_types do
    resources :tickets
  end


  get '/users/user_with_most_tickets', to: 'users#user_with_most_tickets'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
