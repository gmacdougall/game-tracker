class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :instances, :game_id
    add_index :scores, :player_id
    add_index :scores, :instance_id
  end
end
