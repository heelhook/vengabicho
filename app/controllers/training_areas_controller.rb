class TrainingAreasController < ApplicationController
  before_action :set_training_area, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  # GET /training_areas
  def index
    @training_areas = TrainingArea.all
  end

  # GET /training_areas/1
  def show
  end

  # GET /training_areas/new
  def new
    @training_area = TrainingArea.new
  end

  # GET /training_areas/1/edit
  def edit
  end

  def create
    @training_area = TrainingArea.new(training_area_params)
    @training_areas.user = current_user

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

  # Only allow a trusted parameter "white list" through.
  def training_area_params
    params.require(:training_area).permit(
      :name,
      :description,
    )
  end
end
