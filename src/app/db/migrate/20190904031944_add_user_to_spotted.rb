class AddUserToSpotted < ActiveRecord::Migration[5.2]
  def change
    add_reference :spotteds, :user, foreign_key: true
  end
end
