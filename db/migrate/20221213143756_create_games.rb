class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :opponent_id
      t.string :state
      t.integer :winner
      t.integer :current_player
      t.boolean :is_waiting
      t.timestamps
    end
  end
end
