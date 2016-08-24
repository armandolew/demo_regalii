class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all.order("points DESC")
  end
end
