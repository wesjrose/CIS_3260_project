require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "creating a Player" do
    visit players_url
    click_on "New Player"

    fill_in "Colour", with: @player.colour
    check "Is waiting" if @player.is_waiting
    fill_in "Nickname", with: @player.nickname
    fill_in "Num pieces captured", with: @player.num_pieces_captured
    fill_in "Piece on board", with: @player.piece_on_board
    fill_in "Piece pile", with: @player.piece_pile
    fill_in "Player", with: @player.player_id
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "updating a Player" do
    visit players_url
    click_on "Edit", match: :first

    fill_in "Colour", with: @player.colour
    check "Is waiting" if @player.is_waiting
    fill_in "Nickname", with: @player.nickname
    fill_in "Num pieces captured", with: @player.num_pieces_captured
    fill_in "Piece on board", with: @player.piece_on_board
    fill_in "Piece pile", with: @player.piece_pile
    fill_in "Player", with: @player.player_id
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "destroying a Player" do
    visit players_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Player was successfully destroyed"
  end
end
