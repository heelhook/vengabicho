class AddUsersColors < ActiveRecord::Migration
  def change
    add_column :users, :colors, :string
  end
end
