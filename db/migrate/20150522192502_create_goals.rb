class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.date :date

      t.timestamps null: false
    end
  end
end
