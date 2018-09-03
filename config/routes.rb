Rails.application.routes.draw do
  get 'rooms/index'

  get 'rooms/new'

  get 'rooms/edit'

  get 'rooms/destroy'

  root 'static_pages#index'
  resources :sessions, only: [:new, :create]
  delete 'sessions', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
