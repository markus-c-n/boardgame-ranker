class ScoresController < ApplicationController
  def new
  end

  def create
  end

  def index
    @scores = Score.all.sort.reverse
  end

  def show
    @score = Score.find(params[:id])
  end
end
