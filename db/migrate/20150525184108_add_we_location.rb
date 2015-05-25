class AddWeLocation < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :location, :string
  end
end
