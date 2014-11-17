class SkiDaysController < ApplicationController
  before_filter :load_ski_day, only: [:edit, :update, :show, :destroy]

  def edit; end
  def show; end

  def new
    @ski_day = SkiDay.new
    @ski_day.date = Date.today
  end

  def index
    @ski_days = SkiDay.all
  end

  def create
    @ski_day = SkiDay.new(ski_day_params)

    if @ski_day.save
      redirect_to @ski_day
    else
      render 'new'
    end
  end

  def update
    if @ski_day.update(ski_day_params)
      redirect_to @ski_day
    else
      render 'edit'
    end
  end

  def destroy
    @ski_day.destroy
    redirect_to ski_days_path
  end

  private

  def load_ski_day
    @ski_day = SkiDay.find(params[:id])
  end

  def ski_day_params
    params.require(:ski_day).permit(:location, :vertical, :date)
  end
end

