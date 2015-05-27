class TrainingPeriodsController < ApplicationController
  before_action :set_training_period, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @training_periods = current_user.training_periods
  end

  def show
  end

  def new
    @training_period = TrainingPeriod.new
  end

  def edit
  end

  def create
    @training_period = TrainingPeriod.new(training_period_params)
    @training_period.save

    respond_with @training_period, location: -> { training_periods_path }
  end

  def update
    @training_period.update(training_period_params)
    respond_with @training_period, location: -> { training_periods_path }
  end

  def destroy
    @training_period.destroy
    respond_to do |format|
      format.html { redirect_to training_periods_url, notice: 'Training period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_training_period
    @training_period = TrainingPeriod.find(params[:id])
  end

  def training_period_params
    params.require(:training_period).permit(
      :name,
      :start,
      :finish,
      :color,
    ).merge(
      user: current_user,
    )
  end
end
