require_relative 'Rule'

class MovingRule < Rule
    
    def applicable?(game, current_spot, destination_spot)
        return game.state == :move && game.current_player.piece_pile == 0 && game.current_player.pieces_on_board.length > 3
    end

    def valid?(game, current_spot, destination_spot)
        return destination_spot.adj_horiz_spots.include?(current_spot) || destination_spot.adj_vert_spots.include?(current_spot)
    end
end
