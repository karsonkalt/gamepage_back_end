Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'board/new', to: 'board#new'
  get 'board', to: 'board#show'
  post 'board/play/:id', to: 'board#play'
  get 'board/score', to: 'board#score'

  resources :sessions
end
