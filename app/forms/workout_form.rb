class WorkoutForm
  attr_accessor :params, :workout

  def initialize(params, workout)
    p @workout
    @params = params
    @workout = workout
    @workout.save!
  end

  def save
    @workout.workout_exercises.destroy_all
    workout_params_exercises.each do |exercise_name, data|
      exercise = Exercise.find(exercise_name)
      workout_exercise = @workout.workout_exercises.find_or_create_by(exercise: exercise)
      workout_exercise.update_attributes!(data)
    end

    @workout.training_area_points.destroy_all

    workout_params_points.each do |training_area_slug, points|
      next unless points.to_i > 0
      training_area = TrainingArea.find(training_area_slug)
      training_area_points = @workout.training_area_points.find_or_create_by(training_area_id: training_area.id)
      training_area_points.update_attributes!(points: points)
    end

    @workout
  end

  def workout_params_exercises
    params.require(:exercises).permit!
  end

  def workout_params_points
    params.require(:points).permit!
  end
end
