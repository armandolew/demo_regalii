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
    if game.player_1_score.to_i > game.player_2_score.to_i
      ranking = Ranking.find_by(:user_id => game.player_1_id)
      if ranking
        points = ranking.points.to_i + 3
        ranking.update(:points => points)
      end      
      return game.player_1_id
    else
      ranking = Ranking.find_by(:user_id => game.player_2_id)
      if ranking
        points = ranking.points.to_i + 3
        ranking.update(:points => points)
      end      
      return game.player_2_id
    end
  end

  def games_played(user_id)
    @games_played = Game.where('player_1_id =? OR player_2_id =?', current_user.id, current_user.id).count
  end


end
