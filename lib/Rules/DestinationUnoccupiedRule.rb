require_relative 'Rule'

class DestinationUnoccupiedRule < Rule
    
    def applicable?(game, current_spot, destination_spot)
        return true
    end

    def valid?(game, current_spot, destination_spot)
        return !destination_spot || !destination_spot.occupant
    end
end
