class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :nickname
      t.string :piece_on_board
      t.integer :piece_pile
      t.integer :num_pieces_captured
      t.string :colour
      t.boolean :is_waiting
      t.timestamps
    end
  end
end
