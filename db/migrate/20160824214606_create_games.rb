class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_1_id
      t.integer :player_2_id
      t.boolean :played

      t.timestamps null: false
    end
  end
end
