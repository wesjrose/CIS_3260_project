class CreatePieces < ActiveRecord::Migration[6.1]
  def change
    create_table :pieces do |t|
      t.integer :player_id
      t.integer :spot_id

      t.timestamps
    end
  end
end
