class Game < ActiveRecord::Base
  belongs_to :player_1, :class_name => 'User'
  belongs_to :player_2, :class_name => 'User'
  
  validates :player_1_id, presence: true, on: :create
  validates :player_2_id, presence: true, on: :create
  validates :date_played, presence: true, on: :create
  validates :player_1_score, presence: true, on: :create
  validates :player_2_score, presence: true, on: :create
end
