class AddUserToColleges < ActiveRecord::Migration[5.2]
  def change
    add_reference :colleges, :user, foreign_key: true
  end
end
