class CreateWeightIns < ActiveRecord::Migration
  def change
    create_table :weight_ins do |t|
      t.references :user, index: true, foreign_key: true
      t.float :weight
      t.date :date

      t.timestamps null: false
    end
  end
end
