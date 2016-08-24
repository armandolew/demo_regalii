class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :games
  has_one :ranking

  after_create :create_ranking


  def create_ranking
    ranking = Ranking.create(:user_id => self.id)
  end
end
