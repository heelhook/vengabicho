class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.references :workout, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true
      t.text :comments
      t.string :data

      t.timestamps null: false
    end
  end
end
