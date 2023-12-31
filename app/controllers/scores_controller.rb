class ScoresController < ApplicationController
  def index
    @scores = Score.all
    @score = Score.new
    @top_scores = Score.order(total_score: :desc).limit(3)
    @top_city = Score.order(city_points: :desc).limit(1)
    @top_coin = Score.order(coin_points: :desc).limit(1)
    @top_event = Score.order(event_points: :desc).limit(1)
    @top_extra = Score.order(event_points: :desc).limit(1)
  end

  def new
    @score = Score.new
  end

  def show
    @score = Score.find(params[:id])
  end

  def create
    @score = Score.new(score_params)
    @score.total_score = @score.city_points + @score.coin_points + @score.event_points + @score.extra_points if @score.total_score.blank?
    if @score.save
      redirect_to scores_path, notice: 'Score was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_path, status: :see_other
  end

  private

  def score_params
    params.require(:score).permit(:total_score, :city_points, :coin_points, :event_points, :extra_points, :game_mode, :player_id)
  end
end
