class WorkoutForm
  attr_accessor :params, :workout

  def initialize(params, workout)
    @params = params
    @workout = workout
    @workout.save!
  end

  def save
    save_exercises
    save_training_area_points
    save_points
  end

  private

  def save_exercises
    @workout.workout_exercises.destroy_all
    return unless params[:exercises]

    workout_params_exercises.each do |exercise_name, data|
      exercise = Exercise.find(exercise_name)
      workout_exercise = @workout.workout_exercises.find_or_create_by(exercise: exercise)
      workout_exercise.update_attributes!(data)
    end
  end

  def save_training_area_points
    @workout.training_area_points.destroy_all
    return unless params[:training_area_points]

    workout_params_training_area_points.each do |training_area_slug, points|
      next unless points.to_i > 0
      training_area = TrainingArea.find(training_area_slug)
      training_area_points = @workout.training_area_points.find_or_create_by(training_area_id: training_area.id)
      training_area_points.update_attributes!(points: points)
    end
  end

  def save_points
    @workout.update_attributes(workout_params_points)
  end

  def workout_params_exercises
    params.require(:exercises).permit!
  end

  def workout_params_training_area_points
    params.require(:training_area_points).permit!
  end

  def workout_params_points
    params.require(:workout_points).permit(
      :motivation_level,
      :energy_level,
    )
  end
end
