class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show

    redirect_to "/games/start-find/#{params[:id]}"
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #update a player's pieces to be what is currently stored in the database
  def update_pieces
    player_id = params[:id].to_i()
    all_pieces = Piece.all()
    player_pieces_list = []

    all_pieces.each do |current_piece|
      if current_piece.player_id == player_id
        player_pieces_list.append(current_piece.id)
      end
    end

    array_to_json_string = JSON.generate(player_pieces_list)

    puts ("The array of found pieces is: #{array_to_json_string}")

    current_player = self.get_player_with_id(player_id)
    puts ("The current player that was gotten is: #{current_player.id}")
    current_player.piece_on_board = array_to_json_string
    current_player.save()
    puts ("***The current player's pieces are: #{current_player.piece_on_board}")
    render html: "player updated with matching pieces"
  end

  def get_player_with_id(id)
    all_players = Player.all()

    all_players.each do |current_player|
      if current_player.id == id
        return current_player
      end
    end
    return nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:player_id, :nickname, :piece_on_board, :piece_pile, :num_pieces_captured, :colour, :is_waiting)
    end
end
