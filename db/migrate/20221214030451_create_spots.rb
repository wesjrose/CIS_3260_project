class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :x_coord
      t.integer :y_coord
      t.integer :piece_id
      t.integer :game_id
      t.string :adj_horiz_spot
      t.string :adj_vert_spot

      t.timestamps
    end
  end
end
