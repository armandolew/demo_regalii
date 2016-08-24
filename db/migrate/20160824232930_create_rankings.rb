class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.integer :points
      t.integer :position

      t.timestamps null: false
    end
  end
end
