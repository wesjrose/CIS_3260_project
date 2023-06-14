
require 'json'
require 'Spot1'
require 'Player1'
require 'Piece1'
require 'Game1'

class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  def show1
    player_id = params[:id]
    all_games = Game.all()
    found_game = nil

    all_games.each do |current_game|
      if current_game.player_id == player_id.to_i() || current_game.opponent_id == player_id.to_i()
        found_game = current_game
      end
    end

    player_one = self.get_player_with_id(found_game.player_id)
    opponenent_player = self.get_player_with_id(found_game.opponent_id)
    player_one_pieces_board = JSON.parse(player_one.piece_on_board)
    opponenent_player_pieces_board = JSON.parse(opponenent_player.piece_on_board)

    all_pieces_on_board = player_one_pieces_board + opponenent_player_pieces_board

    puts ("The array of spots for this game are: #{all_pieces_on_board}")

    # determining who the current player is:
    if player_one.id == player_id.to_i()
      session_player = player_one
      other_player = opponenent_player
    else
      session_player = opponenent_player
      other_player = player_one
    end
    
    puts ("The current player for this session is: #{session_player.id}")

    white_piece = "\u25EF"
    white_piece = white_piece.encode('utf-8')
    black_piece = "\u2B24"
    black_piece = black_piece.encode("utf-8")
    empty_char = "\u2009\u2009\u2009\u2009\u2009\u2009"
    empty_char = empty_char.encode("utf-8")

    # setting the game information variables for display
    @player_piece_pile = session_player.piece_pile
    @player_captures = session_player.num_pieces_captured
    @other_player_pile = other_player.piece_pile
    @other_player_captures = other_player.num_pieces_captured

    


    # render html: "This is the page for showing the boad#{black_piece}"
    # @board_string_r1 = "#{white_piece} -------------------------- #{white_piece} -------------------------- #{white_piece}"
    # @board_string_r2 = "#{white_piece} ------------------- #{white_piece} ------------------ #{white_piece}"
    # @board_string_r3 = "#{white_piece} -------- #{white_piece} -------- #{white_piece}"
    @board_position_7A = empty_char
    @board_position_7D = empty_char
    @board_position_7G = empty_char
    @board_position_6B = empty_char
    @board_position_6D = empty_char
    @board_position_6F = empty_char
    @board_position_5C = empty_char
    @board_position_5D = empty_char
    @board_position_5E = empty_char
    @board_position_4A = empty_char
    @board_position_4B = empty_char
    @board_position_4C = empty_char
    @board_position_4E = empty_char
    @board_position_4F = empty_char
    @board_position_4G = empty_char
    @board_position_3C = empty_char
    @board_position_3D = empty_char
    @board_position_3E = empty_char
    @board_position_2B = empty_char
    @board_position_2D = empty_char
    @board_position_2F = empty_char
    @board_position_1A = empty_char
    @board_position_1D = empty_char
    @board_position_1G = empty_char

    # iterating through the array of spots to place the stones that are already on the board
    all_pieces_on_board.each do |current_spot_id|

      current_spot = Spot.find_by(id: current_spot_id)
      current_piece_id = current_spot.piece_id
      current_piece_model = Piece.find_by(id: current_piece_id)

      # combining the X and Y into a string for altering the placement
      # variables on for the view
      if current_piece_model
        current_spot_position_string = current_spot.y_coord.to_s()
        current_spot_position_string = current_spot_position_string + current_spot.x_coord
        if session_player.id == current_piece_model.player_id
          current_piece_colour = session_player.colour
        else
          current_piece_colour = other_player.colour
        end

        if current_spot_position_string.upcase == "7A"
          if current_piece_colour == "white"
            @board_position_7A = white_piece
          else
            @board_position_7A = black_piece
          end
        elsif current_spot_position_string.upcase == "7D"
          if current_piece_colour == "white"
            @board_position_7D = white_piece
          else
            @board_position_7D = black_piece
          end
        elsif current_spot_position_string.upcase == "7G"
          if current_piece_colour == "white"
            @board_position_7G = white_piece
          else
            @board_position_7G = black_piece
          end
        elsif current_spot_position_string.upcase == "6B"
          if current_piece_colour == "white"
            @board_position_6B = white_piece
          else
            @board_position_6B = black_piece
          end
        elsif current_spot_position_string.upcase == "6D"
          if current_piece_colour == "white"
            @board_position_6D = white_piece
          else
            @board_position_6D = black_piece
          end
        elsif current_spot_position_string.upcase == "6F"
          if current_piece_colour == "white"
            @board_position_6F = white_piece
          else
            @board_position_6F = black_piece
          end
        elsif current_spot_position_string.upcase == "5C"
          if current_piece_colour == "white"
            @board_position_5C = white_piece
          else
            @board_position_5C = black_piece
          end
        elsif current_spot_position_string.upcase == "5C"
          if current_piece_colour == "white"
            @board_position_5C = white_piece
          else
            @board_position_5C = black_piece
          end
        elsif current_spot_position_string.upcase == "5D"
          if current_piece_colour == "white"
            @board_position_5D = white_piece
          else
            @board_position_5D = black_piece
          end
        elsif current_spot_position_string.upcase == "5E"
          if current_piece_colour == "white"
            @board_position_5E = white_piece
          else
            @board_position_5E = black_piece
          end
        elsif current_spot_position_string.upcase == "4A"
          if current_piece_colour == "white"
            @board_position_4A = white_piece
          else
            @board_position_4A = black_piece
          end
        elsif current_spot_position_string.upcase == "4B"
          if current_piece_colour == "white"
            @board_position_4B = white_piece
          else
            @board_position_4B = black_piece
          end
        elsif current_spot_position_string.upcase == "4C"
          if current_piece_colour == "white"
            @board_position_4C = white_piece
          else
            @board_position_4C = black_piece
          end
        elsif current_spot_position_string.upcase == "4E"
          if current_piece_colour == "white"
            @board_position_4E = white_piece
          else
            @board_position_4E = black_piece
          end
        elsif current_spot_position_string.upcase == "4F"
          if current_piece_colour == "white"
            @board_position_4F = white_piece
          else
            @board_position_4F = black_piece
          end
        elsif current_spot_position_string.upcase == "4G"
          if current_piece_colour == "white"
            @board_position_4G = white_piece
          else
            @board_position_4G = black_piece
          end
        elsif current_spot_position_string.upcase == "3C"
          if current_piece_colour == "white"
            @board_position_3C = white_piece
          else
            @board_position_3C = black_piece
          end
        elsif current_spot_position_string.upcase == "3D"
          if current_piece_colour == "white"
            @board_position_3D = white_piece
          else
            @board_position_3D = black_piece
          end
        elsif current_spot_position_string.upcase == "3E"
          if current_piece_colour == "white"
            @board_position_3E = white_piece
          else
            @board_position_3E = black_piece
          end
        elsif current_spot_position_string.upcase == "2B"
          if current_piece_colour == "white"
            @board_position_2B = white_piece
          else
            @board_position_2B = black_piece
          end
        elsif current_spot_position_string.upcase == "2D"
          if current_piece_colour == "white"
            @board_position_2D = white_piece
          else
            @board_position_2D = black_piece
          end
        elsif current_spot_position_string.upcase == "2F"
          if current_piece_colour == "white"
            @board_position_2F = white_piece
          else
            @board_position_2F = black_piece
          end
        elsif current_spot_position_string.upcase == "1A"
          if current_piece_colour == "white"
            @board_position_1A = white_piece
          else
            @board_position_1A = black_piece
          end
        elsif current_spot_position_string.upcase == "1D"
          if current_piece_colour == "white"
            @board_position_1D = white_piece
          else
            @board_position_1D = black_piece
          end
        elsif current_spot_position_string.upcase == "1G"
          if current_piece_colour == "white"
            @board_position_1G = white_piece
          else
            @board_position_1G = black_piece
          end
        end
      end 
    end
    # test of jsonifying an array of integers

    # test_array = []
    # test_json_string = JSON.generate(test_array)
    # puts ("This is the json string:\n#{test_json_string}")

    # creating a variable that can idicate if it is the players turn
    if found_game.current_player == params[:id].to_i()
      @is_turn = true
    else
      @is_turn = false
    end

    @redirect_url_to_execute_move = "#{session_player.id}/executemove"

  end

  def game_waiting
    player_id = params[:id]
    
    all_games = Game.all()
    found_game = nil

    all_games.each do |current_game|
      if current_game.player_id == player_id.to_i() || current_game.opponent_id == player_id.to_i()
        found_game = current_game
      end
    end
    puts ("the found game is #{found_game}")

    if found_game != nil && found_game.is_waiting == false
      redirect_to "/gamess/#{player_id}"
    end

  end

  #needs to be renamed, submit_move or soemthing?
  def submit_test
    puts ("****These are the parameters\n#{params}")
    current_position = params[:current_position]
    puts ("**** The current position is #{current_position}")
    render html: "this is a dummy page for submitting a move"
  end

  def move_piece(current_game, current_position, desired_position)
    puts "calls execute_move"
    
    if current_game.check_move(current_position, desired_position)
      return true
    else 
      return false
    end 

  end

  #STUB
  def capture_move
    puts "calls capture_move"
  end

  #places the desired piece on board might need referee once implemented
  def placer(desired_position,colour_piece)
    puts "placer stub"
  end

  #to remove a piece from the board might need referee once implemented
  def remover(current_position)
    puts "remover stub"
  end


  # def show
  #   render html: "This is the page for showing the game"
  # end

  def find_game
    puts ("HELLO FROM FIND GAME")
    puts ("The id that was sent to this endpoint is: #{params[:id]}")

    all_games = Game.all()
    found_game = nil
    already_intialized_game = false

    all_games.each do |current_game|
      puts ("A new game is printed:\n #{current_game.id}")
      if current_game.is_waiting == true
        # puts ("The game with id: #{current_game.id} is waiting")
        if current_game.player_id != params[:id].to_i()
          found_game = current_game
        else
          already_intialized_game = true
          puts ("*** Already waiting on a game")
        end
      elsif current_game.player_id == params[:id].to_i() || current_game.opponent_id == params[:id].to_i()
        already_intialized_game = true
      else
        # puts ("The game with id: #{current_game.id} is NOT waiting")
      end
    end

    # creating a new game because one does not exist with this player
    if found_game == nil and already_intialized_game == false
      puts ("There were no games found will now great a new game")

      new_game = Game.new()
      new_game.player_id = params[:id]
      new_game.state = "intialized"
      new_game.is_waiting = true
      new_game.save()
      puts ("This is hello from creating a new game")
      # creating the spots for this game
      create_game_spots_new (new_game.id)

    elsif already_intialized_game == false
      # an opponent has been matched to the game and the
      # game will now be intialized

      found_game.opponent_id = params[:id]
      found_game.is_waiting = false

      player_one = self.get_player_with_id(found_game.player_id)
      opponenent_player = self.get_player_with_id(found_game.opponent_id)

      puts ("***** The opponenet id is: #{opponenent_player.id}")

      # choosing who will be white
      random_number = rand(0..1)
      if random_number == 1
        puts ("The first player is white")
        player_one.colour = "white"
        player_one.piece_pile = 9
        player_one.is_waiting = false
        player_one.num_pieces_captured = 0
        opponenent_player.colour = "black"
        opponenent_player.piece_pile = 9
        opponenent_player.num_pieces_captured = 0
        opponenent_player.is_waiting = false
        found_game.current_player = player_one.id
        opponenent_player.piece_on_board = JSON.generate([])
        player_one.piece_on_board = JSON.generate([])
      else
        puts ("The opponenet player is white")
        player_one.colour = "black"
        player_one.piece_pile = 9
        player_one.num_pieces_captured = 0
        player_one.is_waiting = false
        opponenent_player.colour = "white"
        opponenent_player.piece_pile = 9
        opponenent_player.num_pieces_captured = 0
        opponenent_player.is_waiting = false
        found_game.current_player = opponenent_player.id
        opponenent_player.piece_on_board = JSON.generate([])
        player_one.piece_on_board = JSON.generate([])
      end

      # create the other database entries for pieces and spots

      player_one.save()
      opponenent_player.save()
      found_game.save()
      
      
    end

    redirect_to "/games/waiting/#{params[:id]}"


    # render html: "This is the new find game page"
  end

  def executemove
    #the current players turn
    session_player_id = params[:id].to_i()

    current_game = get_current_game(session_player_id)

    # puts ("****The current player ID is: #{session_player_id}, the game id is: #{current_game.id}")

    #render html: "This is a dummy page for subbmitting a normal move"

    # getting all the spots for the game
    session_player = get_player_with_id(session_player_id)
    
    if current_game.player_id == session_player_id
      other_player = get_player_with_id(current_game.opponent_id)
      
    else
      other_player = get_player_with_id(current_game.player_id)
    end

    #creating and assigning new values to new player Objects
    session_player_object = Player1.new(rand 200)
    other_player_object = Player1.new(rand 200)

    #udating session player with all relevant info


    # taking in the required parameters
    if params[:current_position] == ""
      puts ("The current poisiton was sent")
      from_pile = false
      desired_position = params[:desired_position]

      #pieceToAdd = Piece1.new(session_player.colour,session_player)
      #arrayToParse = JSON.parse(session_player.piece_on_board)
      #arrayToParse.push(pieceToAdd.)
      #session_player.piece_on_board = JSON.generate(arrayToParse)
      #puts session_player.piece_on_board
      #session_player.save()
    else 
      puts ("The current position was NOT sent")
      from_pile = true
      current_position = params[:current_position]
      desired_position = params[:desired_position]
    end


    

    # getting the players game logic classes again




    

    
    # puts ("****The current player id is: #{session_player.id} The opponenet id is: #{other_player.id}")
    # getting all the spots associated with the game
    # spots_and_pieces = get_all_spots_pieces_game(session_player, other_player)
    # puts ("*****This is the return from the getting all spots and pieces:\n#{spots_and_pieces}")
    
    game_logic_hash = get_array_spots_game_logic(current_game.id)
    game_logic_spots = game_logic_hash[:spots]
    player_one_game_logic = game_logic_hash[:player_one]
    player_two_game_logic = game_logic_hash[:player_two]
    puts ("*** This is the list of spots for game logic:\n#{game_logic_spots}")

    # refreshing a game
    # game_logic_game = Game1.new(player_one_game_logic, player_two_game_logic)
    


    #if valid move placing and it is not opponents turn
    current_game.current_player = other_player.id
    
    current_game.save()
    redirect_to "/gamess/#{session_player_id}"
  end



  def get_all_spots_pieces_game(player_one, opponenent_player)
    
    player_one_pieces_board = JSON.parse(player_one.piece_on_board)
    opponenent_player_pieces_board = JSON.parse(opponenent_player.piece_on_board)
    all_pieces_on_board = player_one_pieces_board + opponenent_player_pieces_board

    pieces_return_list = []
    spots_return_list = []

    all_pieces_on_board.each do |current_spot_id|

      current_spot = Spot.find_by(id: current_spot_id)
      spots_return_list.append(current_spot)
      current_piece_id = current_spot.piece_id
      current_piece_model = Piece.find_by(id: current_piece_id)

      # combining the X and Y into a string for altering the placement
      # variables on for the view
      if current_piece_model
        pieces_return_list.append(current_piece_model)
      end
    end

    return {pieces: pieces_return_list, spots: spots_return_list}

  end

  def get_current_game(player_id)

    all_games = Game.all()
    found_game = nil

    all_games.each do |current_game|
      if current_game.player_id == player_id.to_i() || current_game.opponent_id == player_id.to_i()
        found_game = current_game
      end
    end

    return found_game
  end

  def create_game_spots_new(game_id)

    list_spot_coordinates = [
      {xcoord: "A", ycoord: 1},
      {xcoord: "D", ycoord: 1},
      {xcoord: "G", ycoord: 1},
      {xcoord: "B", ycoord: 2},
      {xcoord: "D", ycoord: 2},
      {xcoord: "F", ycoord: 2},
      {xcoord: "C", ycoord: 3},
      {xcoord: "D", ycoord: 3},
      {xcoord: "E", ycoord: 3},
      {xcoord: "A", ycoord: 4},
      {xcoord: "B", ycoord: 4},
      {xcoord: "C", ycoord: 4},
      {xcoord: "E", ycoord: 4},
      {xcoord: "F", ycoord: 4},
      {xcoord: "G", ycoord: 4},
      {xcoord: "C", ycoord: 5},
      {xcoord: "D", ycoord: 5},
      {xcoord: "E", ycoord: 5},
      {xcoord: "B", ycoord: 6},
      {xcoord: "D", ycoord: 6},
      {xcoord: "F", ycoord: 6},
      {xcoord: "A", ycoord: 7},
      {xcoord: "D", ycoord: 7},
      {xcoord: "G", ycoord: 7},
    ]

    list_spots_game = []

    # createing all the new spots without adj_horiz and adj_vert_spot 
    list_spot_coordinates.each do |current_coordinate|
      new_spot = Spot.new()
      new_spot.x_coord = current_coordinate[:xcoord]
      new_spot.y_coord = current_coordinate[:ycoord]
      new_spot.game_id = game_id
      puts ("Saved a new spot x_coord: #{current_coordinate[:xcoord]} y_cood: #{current_coordinate[:ycoord]}")
      list_spots_game.append(new_spot)
    end

    Spot.transaction do 
      list_spots_game.each(&:save)
    end

    # all spots for this game by postion
    seven_a = Spot.find_by(y_coord: 7, x_coord: "A", game_id: game_id)
    seven_d = Spot.find_by(y_coord: 7, x_coord: "D", game_id: game_id)
    seven_g = Spot.find_by(y_coord: 7, x_coord: "G", game_id: game_id)

    
    six_b = Spot.find_by(y_coord: 6, x_coord: "B", game_id: game_id)
    six_d = Spot.find_by(y_coord: 6, x_coord: "D", game_id: game_id)
    six_f = Spot.find_by(y_coord: 6, x_coord: "F", game_id: game_id)

    five_c = Spot.find_by(y_coord: 5, x_coord: "C", game_id: game_id)
    five_d = Spot.find_by(y_coord: 5, x_coord: "D", game_id: game_id)
    five_e = Spot.find_by(y_coord: 5, x_coord: "E", game_id: game_id)

    four_a = Spot.find_by(y_coord: 4, x_coord: "A", game_id: game_id)
    four_b = Spot.find_by(y_coord: 4, x_coord: "B", game_id: game_id)
    four_c = Spot.find_by(y_coord: 4, x_coord: "C", game_id: game_id)
    four_e = Spot.find_by(y_coord: 4, x_coord: "E", game_id: game_id)
    four_f = Spot.find_by(y_coord: 4, x_coord: "F", game_id: game_id)
    four_g = Spot.find_by(y_coord: 4, x_coord: "G", game_id: game_id)

    three_c = Spot.find_by(y_coord: 3, x_coord: "C", game_id: game_id)
    three_d = Spot.find_by(y_coord: 3, x_coord: "D", game_id: game_id)
    three_e = Spot.find_by(y_coord: 3, x_coord: "E", game_id: game_id)

    two_b = Spot.find_by(y_coord: 2, x_coord: "B", game_id: game_id)
    two_d = Spot.find_by(y_coord: 2, x_coord: "D", game_id: game_id)
    two_f = Spot.find_by(y_coord: 2, x_coord: "F", game_id: game_id)

    one_a = Spot.find_by(y_coord: 1, x_coord: "A", game_id: game_id)
    one_d = Spot.find_by(y_coord: 1, x_coord: "D", game_id: game_id)
    one_g = Spot.find_by(y_coord: 1, x_coord: "G", game_id: game_id)
    


    # setting the horizontal and verticle spots for the game
    list_spots_game.each do |current_spot|

      if current_spot.x_coord == "A" && current_spot.y_coord == 7

        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([seven_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_a.id])

        # current_spot.save()
      elsif current_spot.x_coord == "D" && current_spot.y_coord == 7
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([seven_d.id, seven_g.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([six_d.id])

      elsif current_spot.x_coord == "G" && current_spot.y_coord == 7
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([seven_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([six_d.id])

      elsif current_spot.y_coord == 6 && current_spot.x_coord == "B" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([seven_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([six_d.id])

      elsif current_spot.y_coord == 6 && current_spot.x_coord == "D" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([six_b.id, six_f.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([seven_d.id, five_d.id])

      elsif current_spot.y_coord == 6 && current_spot.x_coord == "F" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([six_b.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_f.id])

      elsif current_spot.y_coord == 5 && current_spot.x_coord == "C" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([five_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_c.id])
      
      elsif current_spot.y_coord == 5 && current_spot.x_coord == "D" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([five_c.id, five_e.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([six_d.id])

      elsif current_spot.y_coord == 5 && current_spot.x_coord == "E" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([five_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_c.id])
      
      elsif current_spot.y_coord == 4 && current_spot.x_coord == "A" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([four_b.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([seven_a.id, one_a.id])

      elsif current_spot.y_coord == 4 && current_spot.x_coord == "B" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([four_a.id, four_c.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([two_b.id, six_b.id])

      elsif current_spot.y_coord == 4 && current_spot.x_coord == "C" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([four_b.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([five_c.id, three_c.id])
      
      elsif current_spot.y_coord == 4 && current_spot.x_coord == "E" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([four_f.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([five_e.id, three_e.id])
      
      elsif current_spot.y_coord == 4 && current_spot.x_coord == "F" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([four_e.id, four_g.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([five_e.id, three_e.id])
      
      elsif current_spot.y_coord == 4 && current_spot.x_coord == "G" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([four_f.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([one_g.id, seven_g.id])

      elsif current_spot.y_coord == 3 && current_spot.x_coord == "C" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([three_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_c.id])
      
      elsif current_spot.y_coord == 3 && current_spot.x_coord == "D" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([three_c.id, three_e.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([two_d.id])
      
      elsif current_spot.y_coord == 3 && current_spot.x_coord == "E" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([three_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_e.id])

      elsif current_spot.y_coord == 2 && current_spot.x_coord == "B" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([two_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_b.id])
      
      elsif current_spot.y_coord == 2 && current_spot.x_coord == "D" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([two_b.id, two_f.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([three_d.id, one_d.id])
      
      elsif current_spot.y_coord == 2 && current_spot.x_coord == "F" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([two_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_f.id])
      
      elsif current_spot.y_coord == 1 && current_spot.x_coord == "A" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([one_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_a.id])
      
      elsif current_spot.y_coord == 1 && current_spot.x_coord == "D" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([one_a.id, one_g.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([two_d.id])
      
      elsif current_spot.y_coord == 1 && current_spot.x_coord == "G" 
        # getting the horizontal spots
        current_spot.adj_horiz_spot = JSON.generate([one_d.id])
        # getting the verticle spots
        current_spot.adj_vert_spot = JSON.generate([four_g.id])

      end


    end
    Spot.transaction do
      list_spots_game.each(&:save)
    end
  end

  def delete_game()

    game_id = params[:id].to_i()
    
    all_spots = Spot.all()
    spots_to_delete = []
    pieces_to_delete = []
    all_spots.each do |current_spot|
      if current_spot.game_id == game_id
        spots_to_delete.append(current_spot)
        if current_spot.piece_id
          current_piece = Piece.find_by(id: curernt_spot.piece_id)
          pieces_to_delete.append(current_piece)
        end
      end
    end

    Spot.transaction do
      spots_to_delete.each(&:delete)
    end
    Piece.transaction do
      pieces_to_delete.each(&:delete)
    end

    current_game = Game.find_by(id: game_id)
    if current_game
      current_game.delete()
    end
    render html: "you have deleted game: #{game_id}"
  end

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_all_spots
    #7A
    #7D
    #7G
    #6B
    #6D
    #6F
    #5C
    #5D
    #5E
    #4A
    #4B
    #4C
    #4E
    #4F
    #4G
    #3C
    #3D
    #3E
    #2B
    #2F
    #1A
    #1D
    #1G
  end

  def get_array_spots_game_logic (game_id)

    all_spots = Spot.all()
    spots_for_game = []

    # getting the spots for the game
    all_spots.each do |current_spot|
      if current_spot.game_id == game_id
        spots_for_game.append(current_spot)
      end
    end

    game_logic_spots = []
    hash_game_spots = {}

    current_game = Game.find_by(id: game_id)

    player_one = Player.find_by(id: current_game.player_id)
    player_two = Player.find_by(id: current_game.opponent_id)
    player_one_logic = Player1.new(player_one.nickname)
    player_two_logic = Player1.new(player_two.nickname)
    if player_one.colour == "white"
      player_one_logic.set_colour(:white)
      player_two_logic.set_colour(:black)
    else
      player_one_logic.set_colour(:black)
      player_one_logic.set_colour(:white)
    end
    

    spots_for_game.each do |current_spot_game|
      new_spot = Spot1.new(current_spot_game.x_coord, current_spot_game.y_coord)
      new_spot.set_spot_id(current_spot_game.id)
      hash_game_spots[current_spot_game.id] = current_spot_game
      # getting the piece and setting it if there is one in that spot
      if current_spot_game.piece_id
        current_piece = Piece.find_by(id: current_spot_game.piece_id)
        current_player = Player.find_by(id: current_piece.player_id)
        if current_player.colour == "white"
          if player_one_logic.get_colour() == :white
            new_piece = Piece1.new(:white, player_one_logic)
          else
            new_piece = Piece1.new(:white, player_two_logic)
          end
        elsif current_player.colour == "black"
          if player_one_logic.get_colour() == :black
            new_piece = Piece1.new(:black, player_one_logic)
          else
            new_piece = Piece1.new(:black, player_two_logic)
          end
        end
        # current_player_game_logic = Player1.new(current_player.nickname)
        # current_player_game_logic.set_colour(current_player.colour)
        
        new_spot.set_occupant(new_piece)
      end


      game_logic_spots.append(new_spot)
    end

    # going through the list of spots and adding the vert and horizontal spots
    game_logic_spots.each do |current_spot|
      current_id = current_spot.get_spot_id()
      current_spot_database = hash_game_spots[current_id]

      horizontal_ids = JSON.parse(current_spot_database.adj_horiz_spot) 

      horizontal_ids.each do |current_id|
        game_logic_spots.each do |current_inner_spot|
          if current_inner_spot.get_spot_id == current_spot.get_spot_id
            current_spot.add_horiz(current_inner_spot)
          end
        end
      end 

      vertical_ids = JSON.parse(current_spot_database.adj_vert_spot) 

      vertical_ids.each do |current_id|
        game_logic_spots.each do |current_inner_spot|
          if current_inner_spot.get_spot_id == current_id
            current_spot.add_vert(current_inner_spot)
          end
        end
      end 

    end   

    # # test of spot 155
    # game_logic_spots.each do |current_spot|
    #   if current_spot.get_spot_id == 155
    #     puts ("*** This is spots 155 vert spots:\n#{current_spot.get_vert_spots()}\n\n\n\n")
    #   end
    # end
    
    # creating a return hash
    return_hash = {player_one: player_one, player_two: player_two, spots: game_logic_spots}
      
    return return_hash

  end

  # returns the current player found from id
  def get_player_with_id(id)
    all_players = Player.all()

    all_players.each do |current_player|
      if current_player.id == id
        return current_player
      end
    end
    return nil
  end

  def landing_page()
    
    
  end

  def start_find()
    @player_id = params[:id]
    @url_redirect = "/games/find/#{@player_id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:player_id, :opponent_id, :state, :winner, :current_player)
    end
end
