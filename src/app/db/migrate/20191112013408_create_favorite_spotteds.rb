class CreateFavoriteSpotteds < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_spotteds do |t|
      t.integer :spotted_id
      t.integer :user_id
      t.timestamps
    end
  end
end
