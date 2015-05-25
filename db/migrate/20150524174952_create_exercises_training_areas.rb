class CreateExercisesTrainingAreas < ActiveRecord::Migration
  def change
    create_table :exercises_training_areas do |t|
      t.references :exercise, index: true, foreign_key: true
      t.references :training_area, index: true, foreign_key: true
    end
  end
end
