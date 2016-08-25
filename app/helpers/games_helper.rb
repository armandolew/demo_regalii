module GamesHelper

  def get_opponent(game, user_id)
    if user_id == game.player_1_id
      return game.player_2_id
    else
      return game.player_1_id
    end
  end

  def get_player_username(user_id)
    user = User.find_by(:id => user_id)
    if user
      return user.email
    end
  end

  def get_match_winner(game)
    if game.player_1_score.to_i > game.player_2_score.to_i
      return game.player_1_id
    else
      return game.player_2_id
    end
  end 

  def award_points(game)
    p game.inspect
    if game.player_1_score.to_i > game.player_2_score.to_i
      ranking = Ranking.find_by(:user_id => game.player_1_id)
      if !ranking.nil?
        points = ranking.points.to_i + 3 + upset(game.player_1_id, game.player_2_id)
        ranking.update(:points => points)
      end      
      return game.player_1_id
    else
      ranking = Ranking.find_by(:user_id => game.player_2_id)
      if !ranking.nil?
        points = ranking.points.to_i + 3 + upset(game.player_2_id, game.player_1_id)
        ranking.update(:points => points)
      end      
      return game.player_2_id
    end
  end

  def upset(player_1_id, player_2_id)
    ranking_player_1 = Ranking.find_by(:user_id => player_1_id)
    ranking_player_2 = Ranking.find_by(:user_id => player_2_id)
  
    upset = 0
   

    if !ranking_player_1.nil? and !ranking_player_2.nil?
      if ranking_player_1.points < ranking_player_2.points
        upset = 2
      end
    end
    return upset
  end

  def games_played(user_id)
    @games_played = Game.where('player_1_id =? OR player_2_id =?', user_id, user_id).count
  end


end
