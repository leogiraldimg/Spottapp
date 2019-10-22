class DropUserUnusedAttributes < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :token
    remove_column :users, :uid
    remove_column :users, :name
    remove_column :users, :avatar
  end
end