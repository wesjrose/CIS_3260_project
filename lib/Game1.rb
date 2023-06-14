
require './Player1.rb'
require './Referee.rb'
require './Spot1.rb'
require './Piece1.rb'

class Game1
    attr_accessor :player1
    attr_accessor :player2
    attr_accessor :winner
    attr_accessor :current_player
    attr_accessor :referee
    attr_accessor :current_board
    attr_accessor :state

    def initialize(player1_name, player2_name)
        setup_game(player1_name, player2_name)
    end

    def refresh_game(current_player, opponent, spots)

        @player1 = Player1.new(current_player.name)
        @player2 = Player1.new(opponent.name)

        @player1.captured_pieces = current_player.captured_pieces
        @player2.captured_pieces = opponent.captured_pieces
        @player1.piece_pile = current_player.piece_pile
        @player2.piece_pile = opponent.piece_pile
        @player1.pieces_on_board = current_player.pieces_on_board
        @player2.pieces_on_board = opponent.pieces_on_board

        @referee = Referee.new(@player1, @player2)

        @player1.set_colour(current_player.get_colour())
        @player2.set_colour(opponent.get_colour())

        @current_board = spots
    end

    def check_move(current_spot, destination_spot)
        if @referee.validate()

            if @state == :capture

                do_move(current_spot, destination_spot)
                prepare_next_turn()

            else

                mill = @referee.check_mill(destination_spot)
                do_move(current_spot, destination_spot)

                if mill

                    @state = :capture

                else

                    prepare_next_turn()

                end

            end

            return true

        else

            return false

        end
    end

    def attempt_end()
        if @referee.check_game_end()

            @state = :game_end
            @winner = @referee.get_winnner()

        end

        return @referee.check_game_end()
    end

    def board_view()
        json = '"['+"\n\t"+'"Board":'+"\n\t\t{"

        @current_board.each do |spot|

            json = json + "\n\t\t\t"
            
            if spot.occupant != nil

                json = json + '"' + spot.y_coord.to_s

                if spot.x_coord == :A
                    json = json + "A" + '": "' + spot.occupant.get_colour() + '"'
                elsif spot.x_coord == :B
                    json = json + "B" + '": "' + spot.occupant.get_colour() + '"'
                elsif spot.x_coord == :C
                    json = json + "C" + '": "' + spot.occupant.get_colour() + '"'
                elsif spot.x_coord == :D
                    json = json + "D" + '": "' + spot.occupant.get_colour() + '"'
                elsif spot.x_coord == :E
                    json = json + "E" + '": "' + spot.occupant.get_colour() + '"'
                elsif spot.x_coord == :F
                    json = json + "F" + '": "' + spot.occupant.get_colour() + '"'
                elsif spot.x_coord == :G
                    json = json + "G" + '": "' + spot.occupant.get_colour() + '"'
                end

            else

                json = json + '"' + spot.y_coord.to_s 

                if spot.x_coord == :A
                    json = json + "A" + '": "empty"'
                elsif spot.x_coord == :B
                    json = json + "B" + '": "empty"'
                elsif spot.x_coord == :C
                    json = json + "C" + '": "empty"'
                elsif spot.x_coord == :D
                    json = json + "D" + '": "empty"'
                elsif spot.x_coord == :E
                    json = json + "E" + '": "empty"'
                elsif spot.x_coord == :F
                    json = json + "F" + '": "empty"'
                elsif spot.x_coord == :G
                    json = json + "G" + '": "empty"'
                end

            end
        end

        json = json + "\n\t\t}\n\t" + '"Piles":' + "\n\t\t{\n\t\t\t"
        json = json + '"current player pile": ' + @current_player.piece_pile.to_s + "\n\t\t\t"
        json = json + '"current player captures": ' + @current_player.captured_pieces.to_s + "\n\t\t\t"

        if @current_player.get_colour() != @player1.get_colour()

            json = json + '"opposing player pile": ' + @player1.piece_pile.to_s + "\n\t\t\t"
            json = json + '"opposing player captures": ' + @player1.captured_pieces.to_s + "\n\t\t}\n]" + '"'

        else

            json = json + '"opposing player pile": ' + @player1.piece_pile.to_s + "\n\t\t\t"
            json = json + '"opposing player captures": ' + @player1.captured_pieces.to_s + "\n\t\t}\n]" + '"'

        end

        return json
    end

    private

    def prepare_next_turn()
        if @current_player.get_colour() == @player1.get_colour()

            @current_player = @player2

        else

            @current_player = @player1

        end

    
        if @current_player.piece_pile > 0

            @state = :placepiece

        else

            @state = :move

        end
    end

    def do_move(current_spot, destination_spot)
        if destination_spot == nil && current_spot != nil

            @current_player.remove_piece_from_board(@destination_spot.occupent())
            @current_player.captured_pieces = @current_player.captured_pieces + 1

        elsif current_spot == nil && destination_spot != nil

            piece = Piece1.new(@current_player.get_colour(), @current_player)
            piece.occupied_spot = destination_spot
            destination_spot.occupant = piece
            @current_player.piece_pile = @current_player.piece_pile - 1
            @current_player.add_piece_to_board(piece)

        else

            destination_spot.occupant = current_spot.occupant
            current_spot.occupant.occupied_spot = destination_spot
            current_spot.remove_occupant

        end
    end

    def set_spots()
        board = []


        @referee.board_table.each do |list|

            spot = Spot1.new(list[0], list[1])
            board.append(spot)

        end

        current_location = 0

        @referee.board_table.each do |item|
            item[2].each do |horiz_spot|

                board[current_location].add_horiz(board[horiz_spot])

            end

            item[3].each do |vert_spot|

                board[current_location].add_vert(board[vert_spot])

            end

            current_location = current_location + 1

        end

        return board
    end

    def setup_game(player1_name, player2_name)
        @player1 = Player1.new(player1_name)
        @player2 = Player1.new(player2_name)
        @referee = Referee.new(@player1, @player2)

        if @player1.get_colour() == "white"

            @current_player = @player1

        else

            @current_player = @player2

        end
        
        @current_board = set_spots()
    end

end