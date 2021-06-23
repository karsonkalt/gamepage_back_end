Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'board/new', to: 'board#new'
  post 'board/play/:id', to: 'board#play'

  post 'sessions', to: 'sessions#create'

  post 'scores', to: 'scores#create'

  get 'users', to: 'users#index'

  resources :users, only: [:show] do
    resources :scores, only: [:index]
  end

  #TODO check naming convention here some pluralized some not.
end
