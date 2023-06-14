json.extract! player, :id, :player_id, :nickname, :piece_on_board, :piece_pile, :num_pieces_captured, :colour, :is_waiting, :created_at, :updated_at
json.url player_url(player, format: :json)
