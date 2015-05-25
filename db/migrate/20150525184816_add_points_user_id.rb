class AddPointsUserId < ActiveRecord::Migration
  def change
    add_column :training_area_points, :user_id, :integer, primary_key: true
  end
end
