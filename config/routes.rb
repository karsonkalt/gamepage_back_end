Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'board/new', to: 'board#new'
  get 'board', to: 'board#show'
  post 'board/play/:id', to: 'board#play'
  get 'board/score', to: 'board#score'

  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#delete'

  post 'scores', to: 'scores#create'
  get 'scores/:id', to: 'scores#show'

  get 'users', to: 'users#index'

  resources :users, only: [:show] do
    resources :scores, only: [:index]
  end

  #TODO check naming convention here some pluralized some not.
end
