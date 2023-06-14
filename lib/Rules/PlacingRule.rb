require_relative 'Rule'

class PlacingRule < Rule
    
    def applicable?(game, current_spot, destination_spot)
        return game.state == :move && game.current_player.piece_pile > 0
    end

    def valid?(game, current_spot, destination_spot)
        return !current_spot
    end
end
