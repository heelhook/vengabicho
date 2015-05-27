class TrainingAreasController < ApplicationController
  before_action :set_training_area, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @training_areas = current_user.training_areas
  end

  def show
  end

  def new
    @training_area = TrainingArea.new
  end

  def edit
  end

  def create
    @training_area = TrainingArea.new(training_area_params)
    @training_area.save
    respond_with @training_area, location: -> { training_areas_path }
  end

  def update
    @training_area.update(training_area_params)
    respond_with @training_area, location: -> { training_areas_path }
  end

  def destroy
    @training_area.destroy
    respond_with @training_area, location: -> { training_areas_path }
  end

  private

  def set_training_area
    @training_area = TrainingArea.find(params[:id])
  end

  def training_area_params
    params.require(:training_area).permit(
      :name,
      :description,
    ).merge(
      user: current_user,
    )
  end
end
