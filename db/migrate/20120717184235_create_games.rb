class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :bgg_id
      t.boolean :high_score_win
      t.boolean :exclude

      t.timestamps
    end
  end
end
