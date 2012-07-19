class RenameExcludeToExcludeFromStatsInGame < ActiveRecord::Migration
  def change
    rename_column :games, :exclude, :exclude_from_stats
  end
end
