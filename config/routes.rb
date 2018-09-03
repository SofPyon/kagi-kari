Rails.application.routes.draw do
  root 'static_pages#index'
  resources :sessions, only: [:new, :create]
  delete 'sessions', to: 'sessions#destroy'
  resources :rooms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
