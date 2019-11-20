class UserMenuPreference < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :menu_preference, :string, :default => "list"
  end
end
