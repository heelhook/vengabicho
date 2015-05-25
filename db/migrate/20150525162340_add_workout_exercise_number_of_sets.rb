class AddWorkoutExerciseNumberOfSets < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :number_of_sets, :integer
  end
end
