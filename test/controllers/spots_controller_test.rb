require "test_helper"

class SpotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spot = spots(:one)
  end

  test "should get index" do
    get spots_url
    assert_response :success
  end

  test "should get new" do
    get new_spot_url
    assert_response :success
  end

  test "should create spot" do
    assert_difference('Spot.count') do
      post spots_url, params: { spot: { adj_horiz_spot: @spot.adj_horiz_spot, adj_vert_spot: @spot.adj_vert_spot, game_id: @spot.game_id, piece_id: @spot.piece_id, x_coord: @spot.x_coord, y_coord: @spot.y_coord } }
    end

    assert_redirected_to spot_url(Spot.last)
  end

  test "should show spot" do
    get spot_url(@spot)
    assert_response :success
  end

  test "should get edit" do
    get edit_spot_url(@spot)
    assert_response :success
  end

  test "should update spot" do
    patch spot_url(@spot), params: { spot: { adj_horiz_spot: @spot.adj_horiz_spot, adj_vert_spot: @spot.adj_vert_spot, game_id: @spot.game_id, piece_id: @spot.piece_id, x_coord: @spot.x_coord, y_coord: @spot.y_coord } }
    assert_redirected_to spot_url(@spot)
  end

  test "should destroy spot" do
    assert_difference('Spot.count', -1) do
      delete spot_url(@spot)
    end

    assert_redirected_to spots_url
  end
end
