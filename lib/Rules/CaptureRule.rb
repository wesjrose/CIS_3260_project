require_relative 'Rule'
require_relative '../MillFinder'

class CaptureRule < Rule
    def initialize
        @millFinder = MillFinder.new
    end
    
    def applicable?(game, current_spot, destination_spot)
        return game.state == :capture
    end

    def valid?(game, current_spot, destination_spot)
        if current_spot.occupant && current_spot.occupant.owner != game.current_player && !@millFinder.spot_in_mill(current_spot, game)
            return true
        end
        
        @current_player = game.player1

        if @current_player != game.current_player
            @current_player = game.player2
        end

        @current_player.pieces_on_board.each do |piece|
            if !@millFinder.spot_in_mill(piece.occupied_spot, game)
                return false
            end
        end

        return true

    end
end
