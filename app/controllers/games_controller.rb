class GamesController < ApplicationController
  include GamesHelper
  before_action :set_opponents, only: [:new, :create]
 
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to history_path 
    else
      flash.now[:danger] = "Game could not be save"
      render 'new'
    end
  end

  def index
    @games = Game.where('player_1_id =? OR player_2_id =?', current_user.id, current_user.id).paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def set_opponents
    @opponents_available = User.where('id != ?', current_user.id)
  end
 
  private
   def game_params
     params.require(:game).permit(:date_played, :player_1_id, :player_2_id, :player_1_score, :player_2_score)
   end
end
