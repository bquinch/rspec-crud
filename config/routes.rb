Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show create destroy update]
  resources :messages, only: [:create], constraints: { format: :json }
end
