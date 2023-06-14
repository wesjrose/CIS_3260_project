json.extract! spot, :id, :x_coord, :y_coord, :piece_id, :game_id, :adj_horiz_spot, :adj_vert_spot, :created_at, :updated_at
json.url spot_url(spot, format: :json)
