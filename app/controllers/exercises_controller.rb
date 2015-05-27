class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @exercises = current_user.exercises
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save

    respond_with @exercise, location: -> { exercises_path }
  end

  def update
    @exercise.update(exercise_params)
    respond_with @exercise, location: -> { exercises_path }
  end

  def destroy
    @exercise.destroy
    respond_with @exercise, location: -> { exercises_path }
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(
      :name,
      :description,
      training_area_ids: [],
    ).merge(
      user: current_user,
    )
  end
end
