class AddGoalImageKeyword < ActiveRecord::Migration
  def change
    add_column :goals, :image_keywords, :string
  end
end
