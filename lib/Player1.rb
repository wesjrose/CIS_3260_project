
class Player1

    def initialize(player_name)
        @colour = ""
        @name = player_name
        @piece_pile = 0
        @pieces_on_board = []
        @captured_pieces = 0
    end
    attr_accessor :name, :piece_pile, :pieces_on_board, :captured_pieces

    def get_colour()
        return @colour
    end

    def set_colour(colour)
        @colour = colour
    end

    def remove_piece_from_board(to_remove)
        @pieces_on_board.delete(to_remove)
    end

    def add_piece_to_board(piece_to_add)
        @pieces_on_board.append(piece_to_add)
    end
end