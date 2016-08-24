module GamesHelper

  def get_opponent(game, user_id)
    if user_id == game.player_1_id
      return game.player_2_id
    else
      return game.player_1_id
    end
  end

  def get_player_username(user_id)
    user = User.find_by(user_id)
    if user
      return user.email
    end
  end

  def get_match_winner(game)
    if game.player_1_score.to_i > game.player_2_score.to_i
      return game.player_1_id
    elsif game.player_1_score.to_i < game.player_2_score.to_i
      return game.player_2_id
    end
  end 


end
