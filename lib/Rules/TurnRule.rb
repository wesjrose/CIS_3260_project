require_relative 'Rule'

class TurnRule < Rule
    
    def applicable?(game, current_spot, destination_spot)
        return true
    end

    def valid?(game, current_spot, destination_spot)
        if game.state == :capture
            if current_spot.occupant && current_spot.occupant.owner != game.current_player
                return true
            end
        end

        if game.state == :move
            if !current_spot || current_spot && destination_spot && current_spot.occupant && current_spot.occupant.owner == game.current_player
                return true
            end
        end

        return false

    end
end
