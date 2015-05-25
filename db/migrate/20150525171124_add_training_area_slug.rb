class AddTrainingAreaSlug < ActiveRecord::Migration
  def change
    add_column :training_areas, :slug, :string, primary_key: true
  end
end
