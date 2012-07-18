class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :instance_id
      t.integer :player_id
      t.decimal :score

      t.timestamps
    end
  end
end
