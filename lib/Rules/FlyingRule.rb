require_relative 'Rule'

class FlyingRule < Rule
    
    def applicable?(game, current_spot, destination_spot)
        return game.state == :move && game.current_player.piece_pile == 0 && game.current_player.pieces_on_board.length == 3
    end

    def valid?(game, current_spot, destination_spot)
        return current_spot && destination_spot
    end
end
