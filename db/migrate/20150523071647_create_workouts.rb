class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date, index: true
      t.integer :motivation_level
      t.integer :energy_level

      t.timestamps null: false
    end
  end
end
