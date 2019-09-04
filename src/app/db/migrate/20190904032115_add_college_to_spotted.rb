class AddCollegeToSpotted < ActiveRecord::Migration[5.2]
  def change
    add_reference :spotteds, :college, foreign_key: true
  end
end
