class AddExerciseSlug < ActiveRecord::Migration
  def change
    add_column :exercises, :slug, :string, primary_key: true
  end
end
