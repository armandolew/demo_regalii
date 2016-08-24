class AddDefaultValueToRankings < ActiveRecord::Migration
  def change
    change_column_default :rankings, :points, 0
    change_column_default :rankings, :position, 0
  end
end
