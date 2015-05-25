class AddWeDistance < ActiveRecord::Migration
  def change
    remove_column :exercises, :distance, :integer
    add_column :workout_exercises, :distance, :integer
  end
end
