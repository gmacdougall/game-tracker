class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.date :play_date
      t.integer :game_id

      t.timestamps
    end
  end
end
