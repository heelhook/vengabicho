class AddExerciseType < ActiveRecord::Migration
  def change
    add_column :exercises, :type, :string
  end
end
