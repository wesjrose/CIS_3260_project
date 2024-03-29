# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_14_030451) do

  create_table "games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "opponent_id"
    t.string "state"
    t.integer "winner"
    t.integer "current_player"
    t.boolean "is_waiting"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "player_id"
    t.integer "spot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "nickname"
    t.string "piece_on_board"
    t.integer "piece_pile"
    t.integer "num_pieces_captured"
    t.string "colour"
    t.boolean "is_waiting"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spots", force: :cascade do |t|
    t.string "x_coord"
    t.integer "y_coord"
    t.integer "piece_id"
    t.integer "game_id"
    t.string "adj_horiz_spot"
    t.string "adj_vert_spot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
