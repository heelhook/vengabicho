class CreateTrainingPeriods < ActiveRecord::Migration
  def change
    create_table :training_periods do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.date :start
      t.date :finish
      t.string :color

      t.timestamps null: false
    end
  end
end
