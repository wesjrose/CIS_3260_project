
require_relative 'Player1'
require_relative 'MillFinder'

require_relative 'Rules/CaptureRule'
require_relative 'Rules/DestinationUnoccupiedRule'
require_relative 'Rules/FlyingRule'
require_relative 'Rules/MovingRule'
require_relative 'Rules/PlacingRule'
require_relative 'Rules/TurnRule'

class Referee

    private 
    
    attr_accessor :board_table

    public

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @winner = nil
        @millFinder = MillFinder.new

        @rules = [
            CaptureRule.new,
            DestinationUnoccupiedRule.new,
            FlyingRule.new,
            MovingRule.new,
            PlacingRule.new,
            TurnRule.new
        ]

        @board_table = [ 
            [:A, 1, [1], [9]], [:D, 1, [0, 2], [4]], [:G, 1, [1], [14]],
            [:B, 2, [4], [10]], [:D, 2, [3, 5], [1, 7]], [:F, 2, [4], [13]],
            [:C, 3, [7], [11]], [:D, 3, [6, 8], [4]], [:E, 3, [7], [12]],
            [:A, 4, [10], [0, 21]], [:B, 4, [9, 11], [3, 18]], [:C, 4, [10],[6, 15]],
            [:E, 4, [13], [8, 17]], [:F, 4, [12, 14], [5, 20]], [:G, 4, [13], [2, 23]],
            [:C, 5, [16], [11]], [:D, 5, [15, 17], [19]], [:E, 5, [16], [12]],
            [:B, 6, [19], [10]], [:D, 6, [18, 20], [16, 22]], [:F, 6, [19], [13]],
            [:A, 7, [22], [9]], [:D, 7, [21, 23], [19]], [:G, 7, [22], [14]]
        ]

    end

    def validate(current_spot, destination_spot)
        @rules.each do |rule|
            if rule.applicable?(@game, current_spot, destination_spot) && rule.valid?(@game, current_spot, destination_spot)
                return true
            end
        end
    end

    def get_winner
        return @winner
    end

    def check_mill(destination_spot)
        return spot_in_mill(destination_spot, @game.current_player, )
    end

    def check_game_end
        if @player1.pieces_on_board.length <= 2 && @player1.piece_pile == 0
            @winner = @player2
            return true
          end
      
        if @player2.pieces_on_board.length <= 2 && @player2.piece_pile == 0
            @winner = @player1
            return true
        end
    end

    def toss
        return [:H, :T].sample
    end

end

