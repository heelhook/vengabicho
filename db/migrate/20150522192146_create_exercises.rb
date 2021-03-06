class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :user, index: true, foreign_key: true
      t.references :training_area, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
