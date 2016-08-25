class RemovePlayedFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :played
  end
end
