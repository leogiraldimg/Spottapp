class CreateFavoriteColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_colleges do |t|
      t.integer :college_id
      t.integer :user_id

      t.timestamps
    end
  end
end
