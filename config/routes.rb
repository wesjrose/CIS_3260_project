Rails.application.routes.draw do
  resources :spots
  resources :pieces
  resources :players
  get 'games/find/:id', to: "games#find_game"
  get 'games/waiting/:id', to: "games#game_waiting"
  # get 'games/:id', to: "games#"
  get 'gamess/:id', to: "games#show1"
  post '/move-submit-test', to: "games#submit_test"
  get 'players/new', to: 'players#new'
  get 'games/start-find/:id', to: 'games#start_find'
  post 'gamess/:id/executemove', to: 'games#executemove'
  get 'player-update-pieces/:id', to: 'players#update_pieces'
  get 'delete-game/:id', to: 'games#delete_game'


  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'games#landing_page'
end