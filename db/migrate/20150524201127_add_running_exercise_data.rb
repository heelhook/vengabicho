class AddRunningExerciseData < ActiveRecord::Migration
  def change
    add_column :exercises, :distance, :integer
  end
end
