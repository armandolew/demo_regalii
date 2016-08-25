module RankingsHelper

  def set_rankings
    @rankings = Ranking.order('points DESC')
    
    if @rankings
      @rankings.each_with_index do |ranking, index|
        ranking.update(:position => index + 1)
      end
    end
  end

end
