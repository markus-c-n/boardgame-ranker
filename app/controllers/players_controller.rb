class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to scores_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  private
  def player_params
    params.require(:player).permit(:name, :username)
  end
end
