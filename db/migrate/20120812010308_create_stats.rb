class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :wins
      t.integer :losses
      t.integer :excluded
      t.integer :played

      t.timestamps
    end
  end
end
