class CreateTrainingAreas < ActiveRecord::Migration
  def change
    create_table :training_areas do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
