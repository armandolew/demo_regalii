class AddScoresToGame < ActiveRecord::Migration
  def change
    add_column :games, :player_1_score,  :integer
    add_column :games, :player_2_score,  :integer
  end
end
