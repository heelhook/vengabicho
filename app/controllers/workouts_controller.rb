class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html
  layout :choose_layout

  def index
    @workouts = current_user.workouts
  end

  def show
    @workout.add_exercises
    @workout.add_training_area_points
    @workout.decorate
  end

  def new
    @workout = Workout.new
    @workout.date = Date.parse(params[:date]) if params[:date]
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.save
    respond_with @workout, location: -> { workouts_path }
  end

  def update
    workout_form = WorkoutForm.new(params, @workout)
    workout_form.save
    unless request.xhr?
      redirect_to workouts_path
    else
      head :ok
    end
  end

  def destroy
    @workout.destroy
    respond_with @workout, location: -> { workouts_path }
  end

  private

  def choose_layout
    if request.xhr?
      false
    else
      'application'
    end
  end

  def set_workout
    @workout = Workout.find_or_create_by(user: current_user, date: params[:id]).decorate
  end

  def workout_params
    params.require(:workout).permit(
      :date,
      :motivation_level,
      :energy_level
    ).merge(
      user: current_user,
    )
  end
end
