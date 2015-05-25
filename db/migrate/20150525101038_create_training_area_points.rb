class CreateTrainingAreaPoints < ActiveRecord::Migration
  def change
    create_table :training_area_points do |t|
      t.references :training_area, index: true, foreign_key: true
      t.references :workout, index: true, foreign_key: true
      t.integer :points
      t.date :date, index: true

      t.timestamps null: false
    end
  end
end
