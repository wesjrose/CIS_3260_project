json.extract! game, :id, :player_id, :opponent_id, :state, :winner, :current_player, :created_at, :updated_at
json.url game_url(game, format: :json)
