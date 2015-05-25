class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  delegate(
    :name,
    :slug,
    :training_areas,
    to: :exercise, prefix: false)
end
